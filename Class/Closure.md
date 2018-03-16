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

<p align="center"><img width="200" height="200" src="/Img/closure1.png"></p>

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
eversedNames = names.sorted(by: { $0 > $1 } )
~~~

### Operator Methods

> 위 shorthand argument 뿐만이 아니라 더 코드를 줄 일 수 있습니다 operator("<") 가 자체가 의미하는
> 것은 만약 String 타입의 데이터를 비교한다는 전제가 있다면 2개의 인수를 비교하는 것이기 때문에 operator만
> 입력하더라도 swift가 추론이 가능합니다 

~~~
reversedNames = names.sorted(by: >)
~~~

## Trailing Closures

> Trailing Closure는 인수로 함수가 들어오는 경우를 말하며 문법은 아래와 같습니다

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

## Capturing Values

## Closures Are Reference Types

## Escaping Closures

## Autoclosures

