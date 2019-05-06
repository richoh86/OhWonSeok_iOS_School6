# Transforming Operators

## toArray

> Transform elements to Array  

~~~swift
example(of: "toArray") {

    let disposeBag = DisposeBag()

    Observable.of("A", "B", "C")
        .toArray()
        .subscribe(onNext:{
            print($0)
        })
        .disposed(by: disposeBag)
}
~~~

~~~
*console log

 --- Example of: toArray ---
["A", "B", "C"]
~~~

## map

> Transform each elements by dev's logic

### ex1)

~~~swift
example(of: "map") {
  let disposeBag = DisposeBag()
// 1
  let formatter = NumberFormatter()
  formatter.numberStyle = .spellOut
// 2
  Observable<NSNumber>.of(123, 4, 56)
    // 3
.map {
      formatter.string(from: $0) ?? ""
    }
    .subscribe(onNext: {
      print($0)
})
    .disposed(by: disposeBag)
}
~~~

~~~
*console log
--- Example of: map ---
백이십삼
사
오십육
~~~

### ex2)

> enumerated() (index, element) is added 

~~~swift
example(of: "enumerated and map") {
  let disposeBag = DisposeBag()
// 1
  Observable.of(1, 2, 3, 4, 5, 6)
  // 2
  .enumerated()
  // 3
  .map { index, integer in
    index > 2 ? integer * 2 : integer
  }
// 4
  .subscribe(onNext: {
    print($0)
})
  .disposed(by: disposeBag)
}
~~~
~~~
*console log
--- Example of: enumerated and map ---
1
2
3
8 
10 
12
~~~

## flatMap

~~~swift
struct Student {
    var score: BehaviorSubject<Int>
}

example(of: "flatmap") {

    let disposeBag = DisposeBag()

    let ryan = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 90))

    let student = PublishSubject<Student>()

    student
        .flatMap{ // Networking Operation
            $0.score
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)

    student.onNext(ryan)
    ryan.score.onNext(85)

    student.onNext(charlotte)
    ryan.score.onNext(95)
    charlotte.score.onNext(100)
}
~~~

~~~
*console log
--- Example of: flatmap ---
80
85
90
95
100
~~~

## flatMapLatest

> Latest observable element only emitted

~~~swift
// flatMapLatest with networking operations
example(of: "flatMapLatest") {

    let disposeBag = DisposeBag()

    let ryan = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 90))

    let student = PublishSubject<Student>()

    student
        .flatMapLatest {
            $0.score
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)

    student.onNext(ryan)
    ryan.score.onNext(85)

    student.onNext(charlotte)
    ryan.score.onNext(95)

    charlotte.score.onNext(100)
}
~~~

~~~
*console log
--- Example of: flatMapLatest ---
80
85
90
100
~~~

## materialize & dematerialize

### materialize
> wrapping observable with event

~~~swift
example(of: "materialize and dematerialize") {

    enum MyError: Error {
        case anError
    }

    let disposeBag = DisposeBag()

    let ryan = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 100))

    let student = BehaviorSubject(value: ryan)

    // 1
    let studentScore = student
        .flatMapLatest{
            $0.score.materialize()
            //  wrapping 하는 것 => 바깥 이벤트는 error에 영향을 받지 않는다
        }

    studentScore
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)

    // 3
    ryan.score.onNext(85)
    ryan.score.onError(MyError.anError)
    ryan.score.onNext(90)

    // 4
    student.onNext(charlotte)
    charlotte.score.onNext(120)
}
~~~

### dematerialize

> unwrapping event

~~~swift
example(of: "materialize and dematerialize") {

    enum MyError: Error {
        case anError
    }

    let disposeBag = DisposeBag()

    let ryan = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 100))

    let student = BehaviorSubject(value: ryan)

    // 1
    let studentScore = student
        .flatMapLatest{
            $0.score.materialize()
        }

    studentScore
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)

    // 2
    studentScore
        .filter{
            guard $0.error == nil else {
                print($0.error)
                return false
            }
            return true
        }
        .dematerialize()
        .subscribe(onNext:{
            print($0)
        })
        .disposed(by: disposeBag)

    // 3
    ryan.score.onNext(85)
    ryan.score.onError(MyError.anError)
    ryan.score.onNext(90)

    // 4
    student.onNext(charlotte)
    charlotte.score.onNext(120)
}
~~~