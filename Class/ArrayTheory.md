# Collection Type #1

## Array 정의 : 
> 배열(Array)의 번호(Index)와 번호에 대응하는 데이터들로 이루어진 자료구조를 나타낸다

- 각 데이터의 값들은 타입은 같아야한다
- 데이터가 추가되는 순서대로 인덱스가 순서대로 할당된다
- Any 라는 타입을 사용하면 모든 타입의 데이터 값을 받을 수는 있으나 일반적으로 Any 타입을 사용하지는 않는다
- 순서가 보장되어야 한다 => 인덱스(Index)

## Array 문법: 
- 기본표현은 Array<Element>로 Array Type을 나타낸다
- 축약문법 표현 방식은 [Element]이다 
- Element는 데이터 타입 

## Literal 의 기능

> Swift 는 기본타입이라는 것이 없다 (다른 언어와 달리...) 내부적으로는 모두 인스턴스화 시키는 것이다

var name = String(“Joo”)
==>  var name  = “Joo”

Person() <= Person.init(): init을 생략하는 것이고 초기화 메소드를 호출한 상태를 의미

var age = Int(5)
==> var age = 5

Casting 이라는 것은 형변환이 맞지만 실질적으로 위 Int(), String() 이라는 메소드를 호출해서 각 타입으로 새로 만들어주는 것이다

var list:[String] = [“원석”, “앨런 ”] ✌️

## Array 메소드

~~~
배열 선언
var someInt2:[Int] = [1,2,3,4]

배열의 Element 갯수
print(someInt2.count)

빈 배열 확인
print(someInt2.isEmpty)

Element 추가
someInt2.append(contentsOf: [5, 6])

Element 삽입
someInt2.insert(5, at: 2)

Element 삭제
someInt2.remove(at: 3)
someInt2.append(contentsOf: [5, 6])
~~~

## Array 예제

~~~
func arrayTest()
{
    var textR: String = ""
    var list:[String] = ["my", "name", "is", "a", "richard"]
    list.append("입니다")
    print("배열의 총 갯수는", list.count,"입니다")
    print(list[3])
    list.remove(at: 3)
    list.insert("my introduce iis my self", at: 0)
    
    for text in list
    {
        textR += text+"|"
    }
    
    print(textR)
}

~~~