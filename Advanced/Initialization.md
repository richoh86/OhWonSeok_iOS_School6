# Initialization

> Initialization is the time to manage the inital values of stored properties for named types: classes, structures, and enumerations

~~~swift
let number = Float()
~~~
> You cannot use an instance until it is fully initialized

## Struct Initialization

~~~swift
struct A {

}

let a = A()
~~~

### default initializer

> In the default initializer, the name of the type is followed by empty parentheses. You can use default initializers when your types either don’t have any stored properties, or all of the type’s stored properties have default values

### optional types variable stored property

> The default initializer continues to run fine because optional stored property **variables** are initialized to nil by default. In case of constant, which is declared by 'let', optional type is not allowed by initialization because this property will never have a non-nil value since it is declared as constant

### memberwise initializer

> Swift structures (and only structures) automatically generate memberwise initializer.

1. property's order should be fixed when instance is made by memberwise initializer
2. memberwise initializers only provide parameters for stored properties without default values.

> you only get a memberwise initializer if a structure does not define any initializers. As soon as you define an initializer, you lose the automatic memberwise initializer

### custom intializer

> move the custom initializer into an extension before you instantiate an instance.

~~~swift
struct RocketStageConfiguration {
  let propellantMass: Double
  let liquidOxygenMass: Double
  let nominalBurnTime: Int
}

extension RocketStageConfiguration {
  init(propellantMass: Double, liquidOxygenMass: Double) {
    self.propellantMass = propellantMass
    self.liquidOxygenMass = liquidOxygenMass
    self.nominalBurnTime = 180
  }
}
~~~

> If the main struct definition doesn’t include any initializers, Swift will still automatically generate the default memberwise initializer. Then you can add your custom ones via extensions to get the best of both worlds

~~~swift
init(temperatureFahrenheit: Double = 72, windSpeedMilesPerHour: Double = 5) {
...
~~~

> If the argument value is already allocated in initialzier (in declaration), calling instance with no parameters is possible.

##### An initializer must assign a value to every single stored property that does not have a default value, or else you’ll get a compiler error. Remember that optional variables automatically have a default value of nil!

### Initializer delegation

~~~swift
init(zAngularVelocityDegreesPerMinute: Double, needsCorrection: Int) {
  self.init(zAngularVelocityDegreesPerMinute: zAngularVelocityDegreesPerMinute,
   needsCorrection: (needsCorrection > 0))
}
~~~

> Delegate initialization is useful when you want to provide an alternate initializer argument list but you don’t want to repeat logic that is in your custom initializer. Also, using delegating initializers helps reduce the amount of code you have to write

~~~swift
init(zAngularVelocityDegreesPerMinute: Double) {
  self.needsCorrection = false
  self.init(zAngularVelocityDegreesPerMinute: zAngularVelocityDegreesPerMinute,
    needsCorrection: self.needsCorrection)
}
~~~

> delegating initializers cannot actually initialize any properties. There’s a good reason for this: the initializer you are delegating to could very well override the value you’ve set, and that’s not safe. The only thing a delegating initializer can do is manipulate values that are passed into another initializer

### Putting Two-Phase Initialization to Work

~~~swift
struct CombustionChamberStatus {
  var temperatureKelvin: Double
  var pressureKiloPascals: Double

  init(temperatureKelvin: Double, pressureKiloPascals: Double) {
    print("Phase 1 init")
    self.temperatureKelvin = temperatureKelvin
    self.pressureKiloPascals = pressureKiloPascals
    print("CombustionChamberStatus fully initialized")
    print("Phase 2 init")
  }

  init(temperatureCelsius: Double, pressureAtmospheric: Double) {
    print("Phase 1 delegating init")
    let temperatureKelvin = temperatureCelsius + 273.15
    let pressureKiloPascals = pressureAtmospheric * 101.325
    self.init(temperatureKelvin: temperatureKelvin, pressureKiloPascals: pressureKiloPascals)
    print("Phase 2 delegating init")
  }
}

CombustionChamberStatus(temperatureCelsius: 32, pressureAtmospheric: 0.96)
~~~

~~~
Phase 1 delegating init
Phase 1 init
CombustionChamberStatus fully initialized
Phase 2 init
Phase 2 delegating init
~~~

> phase 1 begins with the call to the delegating initializer init(temperatureCelsius:pressureAtmospheric:) during which self cannot be used. Phase 1 ends right after self.pressureKiloPascals gets assigned a value in the non-delegating initializer. Each initializer plays a role during each phase

### Failable Initializers

~~~swift
struct A {
  var currentVolume: Double
  var currentLiquidType: String?

  init(currentVolume: Double, currentLiquidType: String?) {
    self.currentVolume = currentVolume
    self.currentLiquidType = currentLiquidType
  }
}

let a = A(currentVolume: 0.0, currentLiquidType: nil)
~~~

~~~swift
init?(currentVolume: Double, currentLiquidType: String?) {
...
}
~~~

~~~swift
if let a = A(currentVolume: 0.0, currentLiquidType: nil) {
  print("Nice, A created.") // Printed!
} else {
  print("Oh no, an initialization failure occurred.")
}
~~~

~~~swift
init?(currentVolume: Double, currentLiquidType: String?) {
  if currentVolume < 0 {
    return nil
  }
  if currentVolume > 0 && currentLiquidType == nil {
    return nil
  }
  self.currentVolume = currentVolume
  self.currentLiquidType = currentLiquidType
}
~~~

> For instance, If currentVolume value is lower than 0, it caused return nil in the initialization.

### Throwing From an Initializer

~~~swift
struct Astronaut {
  let name: String
  let age: Int

  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}

enum InvalidAstronautDataError: Error {
  case EmptyName
  case InvalidAge
}

init(name: String, age: Int) throws {
  if name.isEmpty {
    throw InvalidAstronautDataError.EmptyName
  }
  if age < 18 || age > 70 {
    throw InvalidAstronautDataError.InvalidAge
  }
  self.name = name
  self.age = age
}
~~~

~~~swift
let johnny = try? Astronaut(name: "Johnny Cosmoseed", age: 42)
let johnny = try? Astronaut(name: "Johnny Cosmoseed", age: 17) // nil
~~~

> If the terms are not satisfied, it will throw the errors. (EmptyName or Invalid Age)

### Failable initializer Or Throws

~~~
Failable initializers can only express a binary failure/success situation. 
~~~
~~~
By using throwing initializers you can not only indicate failure, but also indicate a reason by throwing specific errors
~~~

