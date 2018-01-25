# Class & Structure / Intialization

## Class & Structure Definition

~~~
* 프로그램 코드 블록의 기본 구조

* 프로퍼티와 메서드 선언 가능

* 단일 파일로 만드는 것이 일반적 (필수는 아님!)

* 인스턴스 생성 및 초기 상태를 설정하기 위하여 initializer(초기화 메소드)를 사용 ; initializer 는 customize 가능

* 두 개의 구조 모두 메모리에 적재되면 instance화

* 기존 블록에 추가하여 확장된 블록 추가 가능 (extensions)

* 프로토콜 채택 가능.
~~~

### 기본 구조 
~~~
class SomeClass {// class definition goes here}

struct SomeStructure {// structure definition goes here}
~~~
### 인스턴스 접근 예제
~~~
클래스 VideoMode 에서 Struct Resolution의 인스턴스를 만들어서 활용할 수 있다 

(단, Struct 에서는 Class를 활용할 수 없다)
~~~

![](/Img/classstruct.png "class&struct")
![](/Img/objectstruct.png "objectstruct")

## Initialization Definition

~~~
* 초기화는 클래스, 구조체, 열거형의 인스턴스를 만들기 위한 준비과정으로 사용

* 클래스와 구조체는 인스턴스로 만들어질 때 모든 프로퍼티가 적절한 초기값으로 초기화 되어야 한다

* 구조체(struct)는 자동으로 Memberwise Initializers가 만들어진다 

(단, 별도로 initializer를 선언하지 않는 경우에만)

~~~
### 기본 Initializer 형태
~~~
init() {
    // perform some initialization here
}
~~~

### Customizing Initialization

> initializer는 개발의 목적에 따라서 customize 가 가능하다

> 아래 예제에서는 fahrenheit 값으로 parameter를 받아서 Celcius 값으로 변환해주는 Initializer와
> kelvin 이라는 값으로 parameter를 받아서 Celcius 값으로 변환해주는 Initializer 2개가 customize 된 것으로 볼 수 있다

~~~
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0
~~~
