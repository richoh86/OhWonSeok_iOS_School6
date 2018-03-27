# Collection Type #3

## Dictionary 정의
> Dictionary는 순서가 정해져 있지 않은 데이터에 키값을 통해 구 분할수 있는 자료구조. 

* 항목의 순서가 중요치 않고 key값을 통해 서 데이터를 접근할때 사용합니다

## Dictionary 문법

* 기본 표현은 Dictionary<key, value>로 Dictionary Type을 나타낸다

* Key값 은 Dictionary에서 value를 가져오는데 사용되는 값이다.

* 또 다른 축약 문법으로 [key:value] 로 표현할 수 있다.


## Dictionary 예제
~~~swift
var someInts:[String:Int] = [String:Int]()

  var someInts:Dictionary<String,Int> = [:]
~~~
## Dictionary 기능

> 기본 딕셔너리var dic:[String:Any] = ["name":"joo", "age":20, "job":"Developer","isSingle":true]> 딕셔너리 추가dic.updateValue("address", forKey: "Seoul")> 딕셔너리 수정dic.updateValue("name", forKey: "winman")> 삭제dic.removeValue(forKey: "isSingle")

## Down casting “as”

> 일반적으로 key의 타입은 String으로 지정합니다. 하지만 value 에 타입은 다양하게 지정해야 되는 경우가 많은데요, 이 경우 어 쩔수 없이 Any Type을 사용합니다.

> Any에서 내가 원하는 타입으로 캐스팅하는 경우를 다운 캐스팅 이라고 하고, as 키워드를 사용해서 캐스팅합니다 

~~~swift
var person:[String:Any] = ["name":"joo", "age":20, "isSingle":true]let name1 = person["name"] //type은 Anylet name2 = person["name"] as! String //type은 String
~~~


