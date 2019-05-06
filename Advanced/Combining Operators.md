# Combining Operators

## startWith

~~~swift
example(of: "startWith") {
  // 1
  let numbers = Observable.of(2, 3, 4)
// 2
  let observable = numbers.startWith(1)
  observable.subscribe(onNext: { value in
    print(value)
  })
}
~~~

~~~
*console log
--- Example of: startWith ---
1
2
3
4
~~~

## concat

> case#1

~~~swift
example(of: "concat") {

    let first = Observable.of(1,2,3)
    let second = Observable.of(4,5,6)

	// 둘 중 하나 사용 할 것 (동일함)
	let observable = Observable.concat([first,second,])
	let observable = first.concat(second)

    observable.subscribe(onNext: {
        print($0)
    })
}
~~~
~~~
*console log
--- Example of: concat ---
1
2
3
4
5
6
~~~

> case#2

~~~swift
example(of: "concatMap") {

    let sequences = [
        "Germany": Observable.of("Berlin", "Munich", "Frankfurt"),
        "Spain": Observable.of("Madrid","Barcelona","Valencia")
    ]

    let observable = Observable.of("Germany", "Spain")
        .concatMap {country in sequences[country] ?? .empty() }

    _ = observable.subscribe(onNext: { str in
        print(str)
    })
}
~~~
~~~
*console log
--- Example of: concatMap ---
Berlin
Munich
Frankfurt
Madrid
Barcelona
Valencia
~~~

## Merging

~~~swift
example(of: "merge") {

    //1
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()

    //2
    let source = Observable.of(left.asObserver(), right.asObserver())

    //3
    let observable = source.merge()
    let disposable = observable.subscribe(onNext: { value in
        print(value)
    })

    //4
    var leftValues = ["Berlin", "Munich", "Franfurt"]
    var rightValues = ["Madrid", "Barcelona", "Valencia"]

    repeat{
        if arc4random_uniform(2) == 0{
            if !leftValues.isEmpty{
                left.onNext("Left: " + leftValues.removeFirst())
            }
        }else if !rightValues.isEmpty{
                right.onNext("Right: " + rightValues.removeFirst())
        }
    } while !leftValues.isEmpty || !rightValues.isEmpty

    disposable.dispose()
}
~~~

~~~
*console log
--- Example of: merge ---
Left: Berlin
Right: Madrid
Right: Barcelona
Right: Valencia
Left: Munich
Left: Franfurt
~~~

## combineLatest

~~~swift
example(of: "combineLastest") {

    let left = PublishSubject<String>()
    let right = PublishSubject<String>()

//  아래 코드와 동일한 내용
//    let observable = Observable.combineLatest(left, right, resultSelector:{
//        lastLeft, lastRight in
//        "\(lastLeft) \(lastRight)"
//    })

    let observable = Observable.combineLatest([left, right]) {
        strings in strings.joined(separator: "")
    }

    let disposable = observable.subscribe(onNext: { value in
        print(value)
    })

    print("> Sending a value to Left")
    left.onNext("Hello,")
    print("> Sending a value to Right")
    right.onNext("world")
    print("> Sending another value to Right")
    right.onNext("RxSwift")
    print("> Sending another value to Left")
    left.onNext("Have a good day,")

    disposable.dispose()
}
~~~

~~~
*console log
--- Example of: combineLastest ---
> Sending a value to Left
> Sending a value to Right
Hello,world
> Sending another value to Right
Hello,RxSwift
> Sending another value to Left
Have a good day,RxSwift
~~~

## zip

> if there is no more element to zip, emit will be stopped

~~~swift
example(of: "zip") {

    let disposeBag = DisposeBag()

    enum Weather{
        case cloudy
        case sunny
    }

    let left: Observable<Weather> = Observable.of(.cloudy,.sunny,.cloudy,.sunny)
    let right = Observable.of("Lisbon", "Copenhagen", "London", "Madrid", "Vienna")

    let observable = Observable.zip(left, right){ weather, city in
        return "It's \(weather) in \(city)"
    }
    observable.subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
}
~~~

~~~
*console log
--- Example of: zip ---
It's cloudy in Lisbon
It's sunny in Copenhagen
It's cloudy in London
It's sunny in Madrid
~~~

## Trigger
### withLastestFrom

> Bring latest element (sample(_:) emits the latest value from the “other” observable)

~~~swift
example(of: "withLastestFrom") {

    // 1
    let button = PublishSubject<Void>()
    let textField = PublishSubject<String>()


    // 2
//    let observable = button.withLatestFrom(textField)
    let observable = textField.sample(button)
    _ = observable.subscribe(onNext: { (value) in
        print(value)
    })

    textField.onNext("Par")
    textField.onNext("Pari")
    textField.onNext("Paris")

	// by sample() codes below will be detected just one time
    button.onNext(())
    button.onNext(())

}
~~~

~~~
console log
--- Example of: withLastestFrom ---
Paris
~~~

## Switches
### amb

> first onNext Observable only will be printed

~~~swift
example(of: "amb") {
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()

    let observable = left.amb(right)
    let disposable = observable.subscribe(onNext: {
        print($0)
    })

    right.onNext("Copenhagen")
    left.onNext("Lisbon")
    left.onNext("London")
    left.onNext("Madrid")
    right.onNext("Vienna")

    disposable.dispose()
}
~~~

~~~
*console log
--- Example of: amb ---
Copenhagen
Vienna
~~~

### switchLatest

> if observable sequence pushed to source anytime, only that observable sequence' element will be emitted 

~~~swift
example(of: "switchLatest") {

    //1
    let one = PublishSubject<String>()
    let two = PublishSubject<String>()
    let three = PublishSubject<String>()

    let source = PublishSubject<Observable<String>>()

    //2
    let observable = source.switchLatest()
    let disposable = observable.subscribe(onNext:{
        print($0)
    })

    // 3
    source.onNext(one)
    one.onNext("Some text from sequence one")
    two.onNext("Some text from sequence two")

    source.onNext(two)
    two.onNext("More text from sequence two")
    one.onNext("and also from sequence one")

    source.onNext(three)
    two.onNext("Why don't you see me?")
    one.onNext("I'm alone, help me")
    three.onNext("Hey it's three. I win.")

    source.onNext(one)
    one.onNext("Nope. It's me, one!")

    source.onNext(two)
    two.onNext("Nope. It's me two")

    disposable.dispose()
}
~~~

~~~
*console log
--- Example of: switchLatest ---
Some text from sequence one
More text from sequence two
Hey it's three. I win.
Nope. It's me, one!
Nope. It's me two
~~~

## Combining elements within a sequence
### reduce

> emit total accumulated value

~~~swift
example(of: "reduce") {

    let source = Observable.of(1, 3, 5, 7, 9)
    
//    let observable = source.reduce(0, accumulator: +)
    let observable = source.reduce(0, accumulator: { summary, newValue in
        return summary + newValue
    })
    
    observable.subscribe(onNext: {
        print($0)
    })
}
~~~

~~~
*console log
--- Example of: reduce ---
25
~~~

### scan

> emit every element value with calculation

~~~swift
example(of: "scan") {
    
    let source = Observable.of(1, 3, 5, 7, 9)
    let observable = source.scan(0, accumulator: +)
    
    observable.subscribe(onNext: { (value) in
        print(value)
    })
    
}
~~~
~~~
*console log
--- Example of: scan ---
1
4
9
16
25
~~~