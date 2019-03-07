# Filtering Operator

## Ignoring Operator

### ignoringElements

> ignoreElements is useful when you only want to be notified when an observable has terminated, via a .completed or .error event.

~~~swift
example(of: "ignoreElements") {
    // 1
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    // 2
    strikes
    .ignoreElements()
    .subscribe { _ in
        print("You're out!")
    }
    .disposed(by: disposeBag)
    
    strikes.onNext("X")
    strikes.onNext("X")
    strikes.onNext("X")
    
    strikes.onCompleted()
}
~~~

~~~
--- Example of: ignoreElements ---
You're out!
~~~
___

> You subscribe to the .next events, ignoring all but the 3rd .next event (found at index 2).

~~~swift
example(of: "elementAt") {
  // 1
  let strikes = PublishSubject<String>()
  let disposeBag = DisposeBag()
// 2
  strikes
    .elementAt(2)
    .subscribe(onNext: { _ in
      print("You're out!")
    })
    .disposed(by: disposeBag)
    
    strikes.onNext("X")
    strikes.onNext("X")
    strikes.onNext("X")
}
~~~

~~~
--- Example of: elementAt ---
You're out!
~~~
___

> You use the filter operator to apply a conditional constraint to prevent odd numbers from getting through. filter takes a predicate that returns a Bool. Return true to let the element through or false to prevent it. filter will filter elements for the life of the subscription  

~~~swift
example(of: "filter") {
    let disposeBag = DisposeBag()
    // 1
    Observable.of(0, 1, 2, 3, 4, 5, 6)
        // 2
        .filter { integer in
            integer % 2 == 0
        }
        // 3
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}
~~~

~~~
--- Example of: filter ---
0
2
4
6
~~~

### Skipping operators

> Use skip to skip the first 3 elements and subscribe to .next events

~~~swift
example(of: "skip") {
  
    let disposeBag = DisposeBag()
    Observable.of("A", "B", "C", "D", "E", "F")
    .skip(3)
    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: disposeBag)

}
~~~

~~~
--- Example of: skip ---
D
E
F
~~~

___

> skip only skips elements up until the first element is let through, and then all remaining elements are allowed through.

~~~swift
example(of: "skipWhile") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(2,2,3,4,4,2,2,2)
        .skipWhile { integer in
            integer % 2 == 0
        }
        .subscribe(onNext:{
            print($0)
        })
        .disposed(by: disposeBag)
}
~~~

~~~
--- Example of: skipWhile ---
3
4
4
2
2
2
~~~
___

> Use skipUntil, passing the trigger subject. When trigger emits, skipUntil will stop skipping

~~~swift
example(of: "skipUntil") {
    let disposeBag = DisposeBag()
    // 1
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    // 2
    subject
        .skipUntil(trigger)
        .subscribe(onNext: {
            print($0) })
        .disposed(by: disposeBag)
    
    subject.onNext("A")
    subject.onNext("B")
    
    trigger.onNext("X")
    
    subject.onNext("C")
}
~~~

~~~
--- Example of: skipUntil ---
C
~~~

### Taking operators

> Take the first 3 elements using take

~~~swift
example(of: "take") {
    let disposeBag = DisposeBag()
    // 1
    Observable.of(1, 2, 3, 4, 5, 6)
        // 2
        .take(3)
        .subscribe(onNext: {
            print($0) })
        .disposed(by: disposeBag)
}
~~~

~~~
--- Example of: take ---
1
2
3
~~~

___

> As a result, you only receive elements as long as the integers are even and up to when
the element’s index is 3 or greater.

* fail 할때까지 take, fail시 뒤로 이어지는 element는 나오지 않음

~~~swift
// 
example(of: "takeWhile") {
    let disposeBag = DisposeBag()
    // 1
    Observable.of(2, 2, 4, 4, 6, 6)
        // 2
        .enumerated()
        // 3
        .takeWhile { index, integer in
            // 4
            integer % 2 == 0 && index < 3
        }
        // 5
        .map { $0.element }
        // 6
        .subscribe(onNext: {
            print($0) })
        .disposed(by: disposeBag)
}
~~~

~~~
--- Example of: takeWhile ---
2
2
4
~~~

___

> takeUntil can also be used to dispose of a subscription, instead of adding it to a dispose bag.

~~~swift
// example(of: "takeUntil") {
    
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
    .takeUntil(trigger)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    subject.onNext("1")
    subject.onNext("2")
    
    trigger.onNext("X")
    
    subject.onNext("3")
}
~~~

~~~
--- Example of: takeUntil ---
1
2
~~~

### Distinct operators

> distinctUntilChanged only prevents contiguous duplicates. So the 2nd element is prevented because it’s the same as the 1st, but the last item, also an A, is allowed through, because it comes after a different letter (B).

~~~swift
example(of: "distinctUntilChanged") {
  let disposeBag = DisposeBag()
// 1
Observable.of("A", "A", "B", "B", "A")
// 2
  .distinctUntilChanged()
  .subscribe(onNext: {
print($0) })
  .disposed(by: disposeBag)
}
~~~

~~~
--- Example of: distinctUntilChanged ---
A
B
A
~~~

___

> you can provide your own custom comparing logic by using distinctUntilChanged(_:), where the externally unnamed parameter is a comparer.

~~~swift
example(of: "distinctUntilChanged(_:)") {
  
    let disposeBag = DisposeBag()
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    Observable<NSNumber>.of(10, 110, 20, 200, 210, 310)
        .distinctUntilChanged { a, b in
            guard let aWords = formatter.string(from: a)?.components(separatedBy: " "),
                let bWords = formatter.string(from: b)?.components(separatedBy: " ")
                else {
                    return false
            }
            
            var containsMatch = false
           
            for aWord in aWords {
                for bWord in bWords{
                    if aWord == bWord {
                        containsMatch = true
                        break
                    }
                }
            }
            
            return containsMatch
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}
~~~

~~~
--- Example of: distinctUntilChanged(_:) ---
10
20
200
~~~