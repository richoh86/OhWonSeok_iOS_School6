# 기초문법

~~~~
변수 : 프로그램에서 데이터의 저장공간을 담당

함수 : 프로그램이 실행되는 행동을 담당
~~~~

## 변수문법

**변수 선언**

~~~~
키워드 + 변수 명(Name) + 변수 타입 (Type)

문법 : var vName: Any 
—> 변수 타입 전에 한칸을 띄어서 입력 (애플사에서 사용하는 방법)

변수명은 Lower Camel Case 로만 작성 (Objective-C ,Swift는 일단 해당되며, 다른 언어들은 다를 수 있다)
변수타입은 첫글자가 무조건 대문자 Upper Camel Case
~~~~
**변수 값 할당**

~~~~
변수 명(Name)  = 값(Value)

문법 var vName: Any = 3

Any : 모든 타입
~~~~

## 함수

~~~~
x : 미지수, input value, 매개변수 (parameter)

x+3 :  Action

y : return type

Input value -> Action -> return type

함수이름 : 함수가 어떤 행동을 하는지 유추할 수 있는 이름으로 짓는다

키워드 + 함수명(Name) + 입력값(Input Value) + 함수 내용(Action) + 결과타입 (Return Type)

문법 : func vName(parameter: Any) -> Any
{

// 함수 내용
 
   } 
~~~~

* “->” 양쪽에 빈칸을 띄우든지, 양쪽다 없애든지 해야한다

* Parameter 앞에는 var 가 필요없다 함수 내에서는 컴파일이 필요없기 때문이다

* ‘-> Any’ 를 제외시키면 반환값이 없는 함수가 된다 (내부적으로는 값을 가짐)

* 타입의 종류는 여러가지로 사용할 수 있으나 그 중 한개만 사용해야 한다

## 클래스

~~~
클래스는 연관되어 있는 변수와 메소드의 집합
~~~

* Self.은 자기 자신의 클래스를 가르친다

* Class 이름은 Upper Camel Case로 만든다

* 이유는 type으로 클래스 이름이 사용되기 때문이다 (객채셍성시)

## Example

![class_variables_func](/Img/class_variables_func.png)

## 객체 생성 및 인스턴스 선언 방법

1. 인스턴스(객체 만들기) - 초기화   

~~~
사람()
~~~   

2. 인스턴스 변수에 저장

~~~
var 원석: 사람 = 사람()
~~~

3. 인스턴스의 속성(변수), 함수 접근 및 실행 (닷 . 문법사용)

~~~
원석.이름 = "오원석"
원석.달리기()
~~~

## Example

![object](/Img/object.png)
