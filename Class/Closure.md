# Closure

- Inline Closure: closure 함수에 받는 1개 이상의 매개변수가 단순 데이터 타입인 경우
- Trailing Closure: closure의 인수에 다시 함수가 들어가는 경우

## Definition

> Closures are self-contained blocks of functionality that can be passed around and used in your code


## Closure Expressions

### The Sorted Method

> 클로저는 데이터를 정렬하는 메소드로 활용이 가능합니다

~~~
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
~~~

> backward 라는 function을 sorted(by: $), $에 넣어주고 실행이 가능합니다
> 알파벳 정렬은 E,D,C,B,A 순으로 s1 > s2 의 로직으로 정렬했기 때문에 아래 배열에는 다음과 같은 순서로 저장됩니다

 * reversedNames = ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

~~~
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
~~~
### Closure Expression Syntax

> closure 의 표현 방식은 아래 이미지와 같습니다

<p align="center"><img width="400" height="300" src="/Img/closure1.png"></p>

> 위에서 설명했었던 코드에서 backward 함수를 다음과 같이 표현합니다

~~~
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
~~~

### Inferring Type From Context

> 여기서 sorted()라는 메소드가 (String, String) -> Bool 타입의 함수이기 때문에 추론이 가능하기 때문에, 괄호와 -> 경우는 생략이 가능합니다 

~~~
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
~~~

### Implicit Returns from Single-Expression Closures

> sorted(by:) 함수 타입 같은 경우 명확하게 Bool 값을 반환해야 합니다 
> s1 > s2 로직을 보더라도 반드시 Bool 값을 return 해야 하기 때문에 return 키워드는 생략이 가능합니다

~~~
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
~~~


### Shorthand Argument Names

> swift는 자동적으로 inline closure에 Shorthand argument를 제공합니다

> $0 and $1 refer to the closure’s first and second String arguments.

~~~
reversedNames = names.sorted(by: { $0 > $1 } )
~~~

### Operator Methods

> 위 shorthand argument 뿐만이 아니라 더 코드를 줄 일 수 있습니다 operator("<") 가 자체가 의미하는
> 것은 만약 String 타입의 데이터를 비교한다는 전제가 있다면 2개의 인수를 비교하는 것이기 때문에 operator만
> 입력하더라도 swift가 추론이 가능합니다 

~~~
reversedNames = names.sorted(by: >)
~~~

## Trailing Closures

> Trailing Closure는 함수 "()" 끝난 뒤 지점에서 함수를 선언하는 closure 문법입니다 

~~~
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
 
// Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
 
// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
~~~

> inline closure 예제 closure를 Trailing으로 변경하면 다음과 같습니다

~~~
reversedNames = names.sorted(by: { $0 > $1 } ) : inline closure
reversedNames = names.sorted() { $0 > $1 } : trailing closure
~~~

> 아래 예제는 map 함수를 활용하여 closure로 구현되었습니다
> 함수 구현의 목적은 digitNames 배열안에 들어있는 dictionary에서 numbers 배열안에 들어있는 각각의
> Int 숫자의 각 자리숫자를 String 값으로 변경시킨 후 다시 배열로 반환하는 것입니다

- 결과 값 : strings = ["OneSix", "FiveEight", "FiveOneZero"]

~~~
	let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510]
     
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat{
                output = digitNames[number % 10]! + output
                number /= 10
            }while number > 0
            
            return output
        }
~~~

## Capturing Values

> 아래 closure 함수에서는 "{ }" body 안있는 runningTotal 값과 amount 값의 reference를 capture 해두기
> 때문에 makeIncrementer 함수가 호출되고 난 뒤 다시 호출하면 runningTotal과 amount값을 그전에 호출했을 때
> 구현된 로직에 의해 연산된 값으로 저장되어 있기 때문에 capture 된 값으로 한번 더 연산이 되어 값이 반환된다    

~~~
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
~~~

> 0에서 숫자 10만큼 증가시키기 위해서 파라미터로 10을 넣어 인스턴스를 생성한 후
> incrementByTen()을 3회 호출시 반환 값이 reference capture에 의해 10씩 증가한다는 것을 알 수 있다

~~~
let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30
~~~

## Closures Are Reference Types

-  let incrementByTen = makeIncrementer(forIncrement: 10)

> incrementByTen은 closure를 상수로 선택한 것이며 closure 내용 자체를 의미하는 것이 아니다

~~~
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 40
~~~

> 만약 위 코드와 같이 incrementByTen을 다시 다른 인스턴스 상수로 할당해서 실행시키면
> 이전에 capture된 reference를 활용해서 실행된다 따라서, 반환 값은 40이 된다

## Escaping Closures

~~~
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
 
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
 
let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"
 
completionHandlers.first?()
print(instance.x)
// Prints "100"

~~~

> @escaping closure 함수에서 넣어주면 함수 밖에서 선언된 Array completionHandler에 넣어 줄 수 있다
> 즉, @escaping 키워드를 입력하면 함수 밖으로 closure 에서 선언되거나 연산된 값을 내보낼 수 있다 
> @escaping 키워드가 없는 closure는 기본적으로 @noescaping 키워드가 암묵적으로 들어간 것이다 (default)

## Autoclosures

> closure 파라미터에 대입할 내용을 일반 함수 파라미터처럼 입력 
> 매개변수도 없고 반환값도 없어야 한다

~~~
var value2 = 10
func autoclosure(_ arg1: String, _ arg2: @autoclosure () -> ()) { 
  print(arg1)
  arg2()
}

autoclosure("arg1", print("Autoclosure"))

autoclosure("arg1", value2 += 10)
~~~

> Autoclosure 파라미터에 일반적 클로져 형태는 사용이 불가능하다

~~~
autoclosure("arg1") {
  print("Compile Error")
}
autoclosure("arg1", myFunction)   // error
~~~