# UIAlertController

## Definition

> An object that displays an alert message to the user

> 메세지를 화면에 보여주기위해서 사용하는 오브젝트

## Code

~~~swift
let alert = UIAlertController(title: "My Alert", message: @"This is an alert.", preferredStyle: .alert)
 
alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in 
NSLog("The \"OK\" alert occured.")
}))

self.present(alert, animated: true, completion: nil)
~~~
1. UIAlertController 인스턴스를 만든다

2. UIAlertAction 인스턴스로 선택 가능한 옵션을 1개 이상 만들어서 UIAlertController의 인스턴스에 addAction 한다

3. view에 해당 UIAlertController의 인스턴스를 보여준다

## Example Code

![](/Img/alert.png "alert")

> 배팅 금액 확인 메세지

~~~swift
let alertVC = UIAlertController(title: "최소 배팅 금액 $5", message: "배팅하세요!", preferredStyle: .alert)
let action1 = UIAlertAction(title: "확인", style: .default, handler: { (action) in })
alertVC.addAction(action1)
self.present(alertVC, animated: true, completion: nil)
return
~~~