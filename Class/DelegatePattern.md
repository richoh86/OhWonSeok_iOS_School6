# Delegate Pattern

## Protocol

*  프로토콜은 원하는 작업이나 기능이 구현되도록 메서드, 프로퍼티 등으로 요구사항의 청사진을 정의 
*  클래스, 구조체, 열거형은 프로토콜을 채택하면, 프로토콜에서 요구한 사항에 대해 구현해야 함
*  프로토콜을 통해서 공통적인 작업을 강제할 수 있으며, 해당 프로토콜을 채택한 사람이 구현한 메소드 정보도 확인 가능

### Protocol 문법
~~~swift
protocol Runable {
var regCount:Int {get set}
func run() 
}

class Animal: Runable{
var regCount:Int = 0 func run(){} 
}  
~~~

### Protocol 채택

~~~swift
protocol Runable {
var regCount:Int {get set}
func run() 
}

protocol Flying :Runable {
var wingCount:Int {get set} 
}

class Animal: Flying{
var wingCount: Int = 0 var regCount:Int = 0 func run(){} 
 }
~~~

### 추상클래스로서의 Protocol

>프로토콜을 추상 클래스처럼 사용할수 있다.
다음과 같은 클래스가 있고, racing 이라는 함수를 구현하려고 한다면!

~~~swift
class Dog: Runable{ //...
 }

class Horse: Runable{ //...
 }

func racing(animals:[Runable]) -> Runable {
}

프로토콜타입으로 사용가능하다.
let winner:Runable = racing(animals: [Dog(),Horse()])

~~~ 

## Delegate

* 델리케이트는 클래스나 구조체에서의 일부분의 할 일을 다른 인스턴스에게 대신하게 하는 디자인 패턴

* 뷰가 받은 이벤트 상태를 ViewController에게 전달해주기 위해 주료 사용된다
 
* ViewController를 통해 View 구성에 필요한 데이터를 받는 용도로도 사용 

### Delegate Example

> 선언부

~~~swift
class CustomView: UIView {

// 2. 클래스에 delegate 프로퍼티 생성 
var delegate:CustomViewDelegate?

override func layoutSubviews() {
// 3. delegate 인스턴스의 메소드 실행
delegate?.viewFrameChanged(newFrame: self .frame) }
}

// 1. 프로토콜 생성
protocol CustomViewDelegate {
func viewFrameChanged(newFrame:CGRect) }
~~~

> 구현부

~~~swift
// 1. CustomView Delegate 채택
class ViewController: UIViewController, CustomViewDelegate{
   
   override func viewDidLoad() { 
        super . viewDidLoad ()

   // 3. custom instance의 delegate 프로퍼티에 자기자신의 인스턴스를 할당
   (프로토콜 추상화 타입)
   let custom = CustomView() custom.delegate = self
}

// 2. 채택한 Delegate 메소드 구현
func viewFrameChanged(newFrame: CGRect){
// 뷰의 프레임이 변경될때마다 불림
   }
}
~~~