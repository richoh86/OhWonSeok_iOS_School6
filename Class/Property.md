# Property

## Definition
> 변수의 다른 이름

> 클래스, 구조체, 열거형에서 전체 속성으로 사용되는 변수

## Stored Properties (저장 프로퍼티)

> 일반적인 property 라고하며 값을 저장하는 용도로 사용된다

### Lazy Stored Properties

> lazy 키워드를 사용하며, 지연 저장된 속성은 프로퍼티가 사용되기 전까지 초기값이 계산되지 않는 특성을 가지고 있는 프로퍼티 이다

~~~swift
class ViewController: UIViewController {//init 시점이 아닌 사용이 되는 시점에 초기화 한다.lazy var cal:Calculator = Calculator()override func viewDidLoad() {super.viewDidLoad()
 }
cal.average(student: Student())
  }
~~~

* 위 cal. 코드가 실행되기 전에는 초기화가 되지 않는다

## Computed Properties (연산 프로퍼티)

> 실제로 값을 저장하지는 않지만,get,set 키워드를 통해서 값을 간접적으로 설정하거나 받을 수 있다

~~~swift
struct Point {
     var x = 0.0, y = 0.0
 }
struct Size {
     var width = 0.0, height = 0.0
 }
struct Rect {
var origin = Point() 
var size = Size() 
var center: Point {
         get {
             let centerX = origin.x + (size.width / 2)
             let centerY = origin.y + (size.height / 2)
             return Point(x: centerX, y: centerY)
         }
         set(newCenter) {
             origin.x = newCenter.x - (size.width / 2)
             origin.y = newCenter.y - (size.height / 2)
         }
}
 }
~~~

## Property Observer

> property 값의 변화를 감시하고 그에 따라 대응한다

> property 값이 설정 될 때마다 호출된다

~~~swift
var changeValue:Int = 0{
       didSet(oldV){
          print("oldValue \(oldV)")
       }
       willSet(willV)
       {
          print("newValue \(willV)")
} }
   changeValue = 4
~~~

> 위와 같이 초기값이 설정된 저장 프로퍼티에서 사용이 가능하다

> 내부 코드는 didSet: 값이 바뀐 직후, willSet: 값이 바뀌기 직전에 대한 명령 코드를 구현할 수 있다

> 값이름 미지정시 didSet은 oldValue , willSet은 newValue가 기본값으로 지정된다

## Type Properties (타입 프로퍼티) 

> 인스턴스의 속성이 아닌,타입에 따른 속성을 정의 할 수 있다

> static 키워드를 통해서 type property 를 설정할 수 있으며, 클래스의 경우 연산 프로퍼티의 오버라이드를 위해서는 class 키워드를 사용해야 한다

```swift
struct AudioChannel {static let level = 10static var maxLevel = 0var currentLevel: Int = 0 {didSet {if currentLevel > AudioChannel.level{currentLevel = AudioChannel.level}
}
}
}if currentLevel > AudioChannel.maxLevel{}
AudioChannel.maxLevel = currentLevel
```

> 위 코드에서 AudioChannel 클래스명으로 내부 static stored property를 바로 호출 가능하다

## Type Method

> static 키워드로 코드를 구현해야하며, class에서는 class 키워드를 사용해 type method를 표현해야한다

