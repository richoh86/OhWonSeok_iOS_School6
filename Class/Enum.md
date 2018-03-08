# Enum


## Definition

 - 그룹에 대한 연관된 값을 정의하고 사용가능한 타입

 - 다른 언어와 달리 항목 그자체가 고유의 값으로 해당 항목에 값을 매칭 시킬 필요가 없다.(C계열 언어는 Int타입의 값이 매칭됨) 
 - 원시값(rawValue)이라는 형태로 실제 값(정수, 실수, 문자등)을 부여 할수 있다
 - 열거형의 이니셜라이즈를 정의 할수 있으며, 프로토콜 준수, 연산프로퍼티, 메소드등을 만들수 있습니다.

## Enum grammar

> 열거형의 기본적인 형태 

~~~
enum <열거형 이름> {
	case <열거 항목1> 
	case <열거 항목2> 
	case <열거 항목3>
}
~~~

---

> 열거형 예제1

~~~
enum CompassPoint {
    case north
    case south
    case east
    case west
}
~~~

> 열거형 예제2

~~~
enum Planet {
   case mercury, venus, earth,
	mars, jupiter, saturn,
	uranus, neptune
}
~~~

> 열거형 값 지정 (예제1)

~~~
var directionToHead = CompassPoint.west
directionToHead = .north
~~~

> 열거형 예제1을 switch 문으로 변형시켜 구현하는 경우

~~~
switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case .east:
        print("Where the sun rises")
    case .west:
}
print("Where the skies are blue")
~~~

### Associated Values

> 열거형 예제3

~~~
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
~~~

> 열거형 값 지정(예제3)

~~~
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
     productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
~~~

> 얼거형 값 가져오기(예제3)

~~~
 switch productBarcode {
     case .upc(let numberSystem, let manufacturer, let product, let check):
         print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).”)
     case .qrCode(let productCode):
         print("QR code: \(productCode).")
}
~~~

### Raw Values

~~~
enum ASCIIControlCharacter: Character {
             case tab = "\t"
             case lineFeed = "\n"
             case carriageReturn = "\r"
         }

enum Planet: Int{
case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
          enum CompassPoint: String {
              case north, south, east, west
          }
~~~

> .rawValue 프로퍼티를 통해 원시값을 가져올수 있다.

~~~
let earthsOrder = Planet.earth.rawValue
       // earthsOrder is 3
       let sunsetDirection = CompassPoint.west.rawValue
       // sunsetDirection is "west"
~~~

### Initializing from a Raw Value

-  원시값 열거형에서는 초기화 함수를 통해 instance를 만들수 있다. (rawValue:값 지정으 로 인해 생성)

-  초기화를 통해 만든 인스턴스는 옵션널 변수로 만들어 진다.

~~~
enum Planet: Int{
case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
            }
       let possiblePlanet:Planet? = Planet(rawValue: 1)
~~~

### Function

> 열거형 내부에는 함수도 선언이 가능하며 얼거형을 중첩해서 사용도 가능하다

~~~
enum Device {	case iPad, iPhone, AppleTV, AppleWatch	func introduced() -> String {	switch self {		case .AppleTV:		return "\(self) was introduced 2006"		case .iPhone:		return "\(self) was introduced 2007"		case .iPad:		return "\(self) was introduced 2010"		case .AppleWatch:		return "\(self) was introduced 2014"		}	}}print (Device.iPhone.introduced())
~~~

### Computed Property

> 열거형 내부에서 연산프로퍼티도 사용가능하다

~~~
enum Device {	case iPad, iPhone		var year: Int {		switch self {		case .iPhone:
		return 2007		
		case .iPad:		return 2010		}
	}
 }
 	
print (Device.iPhone.year)
~~~