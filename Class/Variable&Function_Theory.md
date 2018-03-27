# Variable

> 코드 정리 잘 할 것 (인덴트, 변수이름, 함수이름 등)

> 유니코드 - 매칭 테이블 (문자가 숫자화) 결국, 영문,한글 모두 지원
> 아스키코드 - 영어만 지원
> -> 그래도 가능한 영문만 사용하는 것을 권장

> 중복 작성 불가 ( 하나의 클래스, 함수 구문안에서)
클래스 변수는 self. 으로 구분 가능

> 시스템 예약어는 사용 할 수 없다 ex) var

> 숫자는 변수 이름으로 시작 불가

> 변수 이름에 공백 포함 불가

> 변수&함수 lower camel case
> 클래스 upper camel case

## 변수 타입 이론 정리

~~~swift
참조형은 클래스. Xxx 형식인데 주소값을 클래스 메모리에 저장해두고 
다른 저장공간에서 참조 내용을 불러오는 구조다

print(Int.Max) 최대값 최소값을 확인 가능

Int8, int16, int32, int64 까지 있는데 현재 사용하는 컴퓨터는
64비트라서 int64 까지 사용가능하며

Int를 사용해도 시스템에서 자동으로 적합한 비트를
찾아서 사용한다

16진법을 많이 사용한다 ex) 0X112136

16진법 계산법

16^2. / 16^1 / 1
3      /   a     / 7

16^2* 3 + 16^1* a+1* 7

!true = false

And = &&
Or = ||

A && B —> A와 B 중 하나라도 false 면 false 다
A || B —> A와 B 중 하나라도 true 면 true 다

64비트 부동소수점을 사용하는 실수 타입 Double (15자리)
32비트 부동소수점을 사용하는 실수 타입 Float (6자리)

10.3 을 2진법으로 만들면 1010

상황에 맞는 타입을 사용하는 것이 좋으나 불확실 할 때는 Double을 사용하는 것을 권장

Ios - Retina display 
4pixel  = 1 point
--> 소수점에 의해서 발생하는 오류들이 생각보다 많아서
항상 코딩할 때 고려해보는 것이 좋다

**Xcode- product 메뉴 - Clean 을 해주면 캐시 등을 모두 삭제할 수 있다

String(문자열)은 Character 의 모음
~~~
## subString
~~~
String을 나누면 subString 타입으로 반환된다 그래서 다시 String으로 캐스팅 해야한다
Swift4에서 추가된 내용이기 때문에 꼭 알아둘 것!
~~~
###  subString 예제

~~~swift
let sampleText = "<<<Hello>>>"
let startIndex = sampleText.index(sampleText.startIndex, offsetBy: 3)
let endIndex = sampleText.index(sampleText.endIndex, offsetBy: -4)

let substring1: Substring = sampleText[startIndex...endIndex]
let resultStr: String = String(substring1) //"Hello"
print(resultStr)
~~~

### 튜플
~~~
타입의 조합!
~~~ 
#### 튜플 예제
~~~swift
(Int, Int) // (String, Int, String)

var sampleTuple: (Int, String, Int) = (3, "oh",4)

print(sampleTuple.2)

func calculator(num1:Int, num2:Int) -> (Int, Int){
    
    return (num1 + num2 ,num1 - num2)
    
}

func calculator1(num1:Int, num2:Int) -> (Int, String){
    
    let sum: Int = num1 + num2
    
    return (sum ,String(sum))
    
}

let result: (Int, String) = calculator1(num1: 10, num2: 3)
let intResult: Int = result.0
let stringResult: String = result.1

print(intResult)
print(stringResult)

let result: (intSum: Int, stringSum: String) = calculator1(num1: 10, num2: 3)
let intResult: Int = result.intSum
let stringResult: String = result.stringSum

print(intResult)
print(stringResult)

nil 은 데이터가 없음을 나타내는 키워드 => 공백을 넣는 것은 데이터 값이 있는 것
옵셔널은 nil 일수도 있다 라는 뜻이다

107.3 을 int 로 캐스팅하면 107

String을 int 로 캐스팅 할 수 있다
~~~

### in-out Parameter Keyword

#### 해당 기능으로 매개변수 a 와 b 의 값을 서로 바꿀 수 있다 (변경이 가능)
~~~swift
Func swapTwoInts ( _ a: inout Int, _ b: inout Int) {

let temporaryA = a
a = b
b = temporaryA

}
~~~
#### 함수 사용시 인수는 변수를 선언하여 값을 할당해서 사용해야한다

~~~swift
var someInt = 13
var anotherInt = 27
swapTwoInts(&someInt, &anotherInt)
~~~

# Method

> 메소드는 크게 인스턴스 메소드 그리고 타입 메소드로 구분할 수 있다

## Instance Methods

> 인스턴스 메소드는 상위 클래스의 인스턴스를 생성해서 접근할 수 있는 메소드

~~~swift
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
~~~

- increment() increments the counter by 1.

- increment(by: Int) increments the counter by a specified integer amount.

- reset() resets the counter to zero.

~~~swift
let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0
~~~

## Type Methods

> 타입 메소드는 키워드 static, class 가 붙어야 하고, 호출시 인스턴스를 생성하지 않고
> 바로 "클래스 이름." 으로 호출이 가능하다

~~~swift
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()
~~~