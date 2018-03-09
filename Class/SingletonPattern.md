# Singleton Pattern

## Definition

- **싱글톤이란?** 어플리케이션 전 영역의 걸쳐 하나의 클래스의 단 하나의 인스턴스만(객체)을 생성하는 것을 싱글톤 패턴이다
  - **사용이유** : 어플리케이션 내부에서 유일하게 하나만 필요한 객 체에서 사용(셋팅, 데이터 등)
  - 클래스 메소드로 객체를 만들며 static을 이용해서 단 1개의 인 스턴스만 만든다
  - 앱 내에서 공유하는 객체를 만들 수 있다

## Singleton Pattern 인스턴스 만들기

> 아래 코드에서는 싱글톤 패턴으로 만든 sharedInstance 라는 단 하나의 인스턴스를 생성한 것이다
> 따라서, 현재 구현 중인 앱 내에서만 활용이 가능하다

~~~
class SingletonClass {
    // MARK: Shared Instance
    static var sharedInstance:SingletonClass = SingletonClass()
    // Can't init is singleton
    private init()
    {
//초기화가 필요하면 private로 생성 }
}
~~~

## System Singleton Examples

> 그 밖에 시스템 자체적으로 가지고 있는 싱글톤 객체들도 있다

~~~
//스크린 정보를 가지고 있는 객체
let screen = UIScreen.main 

//사용자 정보를 저장하는 객체
let data = UserDefaults.standard 

//어플리케이션 객체
let app = UIApplication.shared

//파일 시스템 정보를 가지고 있는 객에
let fileManager = FileManager.default
~~~