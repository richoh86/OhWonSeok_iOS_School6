# Access Control (접근 제어)

> 외부 모듈에서 접근을 제어하는 수단
 
> 캡슐화 은닉화를 위해서 사용

## 접근 제어 키워드

~~~
Open (개방 접근수준) : 모듈 외부까지 접근 가능

public (공개 접근수준) : 모듈 외부까지 접근 가능

internal (내부 접근수준) : 모듈 내부에서 접근가능, 기본 지정값 

fileprivate (파일외 비공개) : 파일 내부에서만 접근가능

private (비공개) : 기능 정의 내부에서만 가능	
~~~ 

## Open vs Public

> **Open** : 키워드는 UIView (UIkit이라는 모듈에서 가져온 기능) 와 같이 직접 function 의 구현 로직이나 내용을 개발의 목적에 맞게 수정해서 사용할 수 있는 가장 큰 범위의 접근 제어 키워드라고 할 수 있다

> **Public** : 키워드는 Int(),String(),Sorted() 와 같은 자체 function의 기능을 활용만 가능하고 안에 내용을 커스터 마이즈가 불가능하다는 접근 제어 키워드이다

## internal

> **internal** 키워드는 default 키워드이며, 별도의 접근 제어 키워드가 없다면 internal로 보면 된다 그리고 모듈 내부에서만 접근이 가능하다

## fileprivate

> **fileprivate** : 파일 내부에서만 접근 가능

## private

> **private** : 기능 정의 내부에서만 가능


