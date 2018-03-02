# Subscript & Extensions & Generic

## Subscript

- 클래스, 구조체, 열거형의 collection, list, sequence의 멤버에 접근 가능한 단축 문법인 Subscript를 정의할 수 있다

- Subscript는 별도의 setter/getter없이 index를 통해서 데이터를 설정하거나 값을 가져오는 기능을 할 수 있다

- Array[index] /Dictionary["key"] 등의 표현이 Subscript 이다

~~~
subscript(index: Int) -> Int {
    get {
        // return an appropriate subscript value here
    }
    set(newValue) {
        // perform a suitable setting action here
    }
}
~~~
> 연산 프로퍼티와 같이 get/set 으로 선언 가능하며, set의 경우 default parameter로 newValue 가 제공된다

~~~
subscript(index: Int) -> Int {
    // return an appropriate subscript value here
}
~~~
> 위 코드와 같이 get 키워드 없이 subscript를 쓰면, return 값만 받을 수 있도록 설정 할 수 있다

### Example

~~~
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// Prints "six times three is 18"
~~~
> 위 코드는 구조체 TimesTable의 인스턴스를 muliplier 3으로 생성하여 threeTimesTable[6] 즉, index 값이 6인 경우를 계산하여 값을 반환한다

## Extensions

1. Add computed instance properties and computed type properties
2. Define instance methods and type methods
3. Provide new initializers
4. Define subscripts
5. Define and use new nested types
6. Make an existing type conform to a protocol

~~~
extension SomeType {
    // new functionality to add to SomeType goes here
}
~~~

~~~
extension SomeType: SomeProtocol, AnotherProtocol {
    // implementation of protocol requirements goes here
}
~~~
> 위 코드와 같이 extension 이라는 키워드를 사용해서 선언한다

### Computed Properties

> 아래 코드는 extension을 선언하여 구현한 연산 프로퍼티의 예제이다

~~~
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"
~~~

### Initializers

> 선언된 프로퍼티를 초기화 시키거나, 커스텀 초기화 함수를 선언하여 다른 매개변수를 활용하여 초기화를 시킬 수 있다

~~~
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
~~~

### Method

> extension을 활용하여 새로운 인스턴스 메소드나 타입 메소드를 추가할 수 있다

~~~
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!
~~~

#### Mutating Instance Methods

> extension으로 추가된 인스턴스 메소드는 인스턴스 자체를 변경(수정)이 가능하다 이 때 구조체와 같이 (아래 코드의 Int 도 내부를 확인해보면 구조체로 되어있다) mutating 키워드를 사용하여 함수를 선언해야 한다

~~~
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt is now 9
~~~

## Generic

- 어떤 타입에도 유연한 코드를 구현하기 위해 사용되는 기능 
- 코드의 중복을 줄이고, 깔끔하고 추상적인 표현이 가능하다

**[1]** : Int type이 매개변수인 스왑 함수

~~~
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
~~~

**[2]** : String type이 매개변수인 스왑 함수

~~~
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}
~~~

> **[1]**,**[2]** 와 같이 매개변수는 원하는 함수 로직 구현을 위해 타입을 변경해야 한다

~~~
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
~~~

- 하지만 generic을 활용시 실제 type name 대신에 placeholder type name을 (<T>와 같이) 사용해서 a 와 b가
같다는 전제 하에 모든 타입의 변수를 넣어줄 수 있다  

- < > 안에 들어가는 placeholder type name은 정해진 것은 없으며, Dictionary<Key, Value>, 
Array<Element> 와 같이 매개변수 간의 의미있는 관계가 있다면 이름을 적절하게 만들어주는 것이 좋다 만약, 특별한 의미나 관계가 없다면 예전부터 T,U,V 와 같은 이름을 많이 활용하는 편이다 