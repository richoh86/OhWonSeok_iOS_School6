# Collection Type #2

## Set 정의

> Set은 같은 타입의 데이터가 순서없이 모여있는 자료구조, 각 항목의 순서가 중요치 않거나 한번만 표시해야하는 경우 배열대 신 사용된다

- 특정 값을 가져올 수 없다
- Set 을 정렬(sort)하면 리턴 값은 Array 다

## Set 문법

* 기본 표현은 Set<Element>로 Set Type을 나타낸다. 

* 여기에서 Element는 배열에 저장할수 있는 타입이다. 

* Set은 Array와 다르게 축약 문법이 없다.

~~~
var someInts:Set<Int> = Set<Int>()

var someInts:Set<Int> = [1,2,3,4]
someInts = []

var someStrings:Set = [“joo”,”young”]
~~~

## Set 기능

![set 기능](/img/set.png "SetImage")

## Set 예제

~~~
var oddDigits : Set = [ 1, 3, 5, 7, 9 ]
let evenDigits : Set = [2, 4, 6, 8]
let primeDigits : Set = [2, 3, 5, 7]

oddDigits.intersection(evenDigits)
oddDigits.symmetricDifference(primeDigits)
oddDigits.union(evenDigits).sort()
oddDigits.subtract(primeDigits).sort()
~~~
