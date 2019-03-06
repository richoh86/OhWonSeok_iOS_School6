# RxSwift

> **RxSwift** finds the sweet spot between traditionally imperative Cocoa code and purist functional code. It allows you to react to events by using immutable code definitions to process asynchronously pieces of input in a deterministic, composable way

## Observables

> It allows classes to subscribe for values emitted by another class over time.

> The Observable<T> class allows one or more observers to react to any events in real time and update the app UI, or otherwise process and utilize new and incoming data.

### A next event

An event which “carries” the latest (or "next") data value. This is the
way observers “receive” values.

### A completed event

his event terminates the event sequence with success. It means
the Observable completed its life-cycle successfully and won’t emit any other events

### An error event

The Observable terminates with an error and will not emit other
events.

***Example Source***

1. Create observables
2. Subscribe observables
3. Dispose and Terminate

~~~swift
example(of: "create") {

    enum MyError: Error {
        case anError
    }
    
	// DisposeBag 인스턴스 생성
    let disposeBag = DisposeBag()
    
    Observable<String>.create { observer in
        // 1
        observer.onNext("1")

        // error
        observer.onError(MyError.anError)

        // 2
        observer.onCompleted()
        // 3
        observer.onNext("?")
        // 4
        return Disposables.create()
    }
    .subscribe(
        onNext: { print($0) },
        onError: { print($0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") }
        )
    .disposed(by: disposeBag)

}
~~~

**Printed in console**

~~~
--- Example of: create ---
1
anError
Disposed
~~~

## Using Traits

***Singles*** will emit either a .success(value) or .error event. .success(value) is actually a combination of the .next and .completed events. This is useful for one-time processes that will either succeed and yield a value or fail

**Usage** : 
downloading data or loading it from disk.

~~~swift
example(of: "Single") {
  // 1
  let disposeBag = DisposeBag()
// 2
  enum FileReadError: Error {
    case fileNotFound, unreadable, encodingFailed
  }
// 3
  func loadText(from name: String) -> Single<String> {
    // 4
    return Single.create { single in
    // 1
let disposable = Disposables.create()
// 2
guard let path = Bundle.main.path(forResource: name, ofType: "txt") else
{
  single(.error(FileReadError.fileNotFound))
  return disposable
}
// 3
guard let data = FileManager.default.contents(atPath: path) else {
  single(.error(FileReadError.unreadable))
  return disposable
}
// 4
guard let contents = String(data: data, encoding: .utf8) else {
  single(.error(FileReadError.encodingFailed))
  return disposable
}
// 5
single(.success(contents))
return disposable
    }
} 

// 1
loadText(from: "Copyright")
// 2
.subscribe {
// 3
    switch $0 {
    case .success(let string):
      print(string)
    case .error(let error):
      print(error)
    }
  }
  .disposed(by: disposeBag)
}
~~~

***A Completable*** will only emit a .completed or .error event. It doesn't emit any value. You could use a completable when you only care that an operation completed successfully or failed.

**Usage** :
file write

***Maybe*** is a mashup of a Single and Completable. It can either emit
a .success(value), .completed, or .error. If you need to implement an operation that could either succeed or fail, and optionally return a value on success, then Maybe is your ticket.

