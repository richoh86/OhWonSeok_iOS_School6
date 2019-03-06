# RxSwift

> **RxSwift** finds the sweet spot between traditionally imperative Cocoa code and purist functional code. It allows you to react to events by using immutable code definitions to process asynchronously pieces of input in a deterministic, composable way

## Subjects

> Subjects act as both an observable and an observer. You saw earlier how they can receive events and also be subscribed to. The subject received .next events, and each time it received an event, it turned around and emitted it to its subscriber

### PublishSubject

> Starts empty and only emits new elements to subscribers

~~~swift
example(of: "PublishSubject") {

  let subject = PublishSubject<String>()
  subject.onNext("Is anyone listening?")

  let subscriptionOne = subject
    .subscribe(onNext: { string in
      print(string)
    })

  // 위 subject에 subscriber가 있기 때문에 text가 방출 되는 것이다
  subject.on(.next("1"))
  subject.onNext("2")

  let subscriptionTwo = subject
    .subscribe { event in
      print("2)", event.element ?? event)
  }

  subject.onNext("3")

  // 1. subscriptionOne을 dispose 처리 (termination)
  subscriptionOne.dispose()
  // 2. next 이벤트 element 추가시 두번째 구독자만 해당 "4" 이벤트 element를 방출한다
  subject.onNext("4")

  // 1: terminates the subject’s observable sequence
  subject.onCompleted()
  // 2
  subject.onNext("5")
  // 3
  subscriptionTwo.dispose()

  let disposeBag = DisposeBag()

  // 4
  subject
    .subscribe {
      print("3)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

  // 이미 subject가 terminate 되었기 때문에 "?"는 프린트 되지 않음.
  subject.onNext("?")
}
~~~

#### Printed in console

~~~
--- Example of: PublishSubject ---
1
2
3
2) 3
2) 4
2) completed
3) completed
~~~

### BehaviorSubject

> Starts with an initial value and replays it or the latest element to new subscribers.

~~~swift
example(of: "BehaviorSubject") {
  // 4
  let subject = BehaviorSubject(value: "Initial value")
  let disposeBag = DisposeBag()

  subject.onNext("X")

  subject
    .subscribe {
      print("1)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

  // 1
//  subject.onError(MyError.anError)
  subject.onNext("Y")


  // 2
  subject
    .subscribe {
       print("2)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

  subject.onCompleted()
//  subject.onError(MyError.anError)

  subject
    .subscribe {
      print("3)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

}
~~~

#### Printed in console

~~~
--- Example of: BehaviorSubject ---
1) X
1) Y
2) Y
1) completed
2) completed
3) completed
~~~

### ReplaySubject

> Initialized with a buffer size and will maintain a buffer of elements up to that size and replay it to new subscribers.

~~~swift
example(of: "ReplaySubject") {
  // 1
  let subject = ReplaySubject<String>.create(bufferSize: 2)
  let disposeBag = DisposeBag()
  // 2
  subject.onNext("1")
  subject.onNext("2")
  subject.onNext("3")
  // 3
  subject
    .subscribe {
      print("1)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

  subject
    .subscribe {
      print("2)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

  subject.onNext("4")
  subject.onError(MyError.anError)
  subject.dispose()

  subject
    .subscribe {
      print("3)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)
}
~~~

#### Printed in console

~~~
--- Example of: ReplaySubject ---
1) 2
1) 3
2) 2
2) 3
1) 4
2) 4
1) error(anError)
2) error(anError)
3) error(Object `RxSwift.(unknown context at 0x1259e6e88).ReplayMany<Swift.String>` was already disposed.)
~~~

### Variable

> Wraps a BehaviorSubject, preserves its current value as state, and replays only the latest/initial value to new subscribers.

~~~swift
example(of: "Variable") {
  // 1
  let variable = Variable("Initial value")
  let disposeBag = DisposeBag()
  // 2
  variable.value = "New initial value"
  // 3
  variable.asObservable()
    .subscribe {
      print("1)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)
  
  // 1
  variable.value = "1"
  // 2
  variable.asObservable()
    .subscribe {
      print("2)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)
  // 3
  variable.value = "2"
    
}
~~~

> There is no way to add an .error or .completed event onto a variable. Any attempts to do so will generate compiler errors.

~~~swift
// These will all generate errors
variable.value.onError(MyError.anError)
variable.asObservable().onError(MyError.anError)
variable.value = MyError.anError
variable.value.onCompleted()
variable.asObservable().onCompleted() 
~~~

#### Printed in console

~~~
--- Example of: Variable ---
1) New initial value
1) 1
2) 1
1) 2
2) 2
~~~
