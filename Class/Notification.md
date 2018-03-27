# Notification

## Definition

- 특정 이벤트가 발생 하였음을 알리기 위해 불특정 다수의 객체에게 알리기 위해 사용하는 클래스
- 어떤 객체라도 특정 이벤트가 발생했다는 알림을 받을 것이 라고 관찰자(Observer)로 등록을 해두면 노티피케이션 센터 가 모든 관찰자 객체에게 알림을 준다

## Notification Structure

![notification](/Img/noti.png "notification" )

## Notification main Method

- Initializing : 초기화

~~~swift
open class var `default`: NotificationCenter { get }
~~~

- Add Observer : 옵져버 등록 함수
 
~~~swift
open func addObserver(_ observer: Any,   selector aSelector: Selector,  
name aName: NSNotification.Name?,   object anObject: Any?)

open func addObserver(forName name: NSNotification.Name?,   object obj: Any?,  
queue: OperationQueue?,  
using block: @escaping (Notification) -> Swift.Void)   -> NSObjectProtocol
Post Notification
object anObject: Any?,  
~~~

- Post Notification: Post 함수를 통해 옵저버 함수를 등록한 곳에 Notification 주는 코드

~~~swift
open func post(name aName: NSNotification.Name,  
userInfo aUserInfo: [AnyHashable : Any]? = nil)
Remove Observer
~~~

- Remove Observer : 등록한 옵져버 함수를 삭제한다

~~~swift
open func removeObserver(_ observer: Any)
~~~

## System Notification

```swift
Observer
func observerNoti(noti:Notification){
}
func trakingPost(noti:Notification)
{
//noti 내용
}
```

> Poster

>> 키보드가 올라올때 시스템에서 자동으로 Noti를 post해준다