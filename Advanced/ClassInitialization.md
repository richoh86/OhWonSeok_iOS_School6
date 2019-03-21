# Class Initialization

## Initializer Delegation

### Designated Initializers

> designated initializer is just a fancy term for a non-delegating initializer

~~~swift
class RocketComponent {
  let model: String
  let serialNumber: String
  let reusable: Bool

  // Init #1a - Designated
  init(model: String, serialNumber: String, reusable: Bool) {
    self.model = model
    self.serialNumber = serialNumber
    self.reusable = reusable
  }
}
~~~

### Convenience Initializers

> delegating initializer 

~~~swift
// Init #1b - Convenience
convenience init(model: String, serialNumber: String) {
  self.init(model: model, serialNumber: serialNumber, reusable: false)
}
~~~

### Failing and Throwing from Designated Initializers  

~~~swift
// Init #1c - Designated
init?(identifier: String, reusable: Bool) {
  let identifierComponents = identifier.components(separatedBy: "-")
  guard identifierComponents.count == 2 else {
    return nil
  }
  self.reusable = reusable
  self.model = identifierComponents[0]
  self.serialNumber = identifierComponents[1]
}
~~~

~~~swift
let component = RocketComponent(identifier: "R2-D21", reusable: true)
let nonComponent = RocketComponent(identifier: "", reusable: true)
~~~

### Failing and Throwing From Convenience Initializers

~~~swift
// Init #1c - Convenience
convenience init?(identifier: String, reusable: Bool) {
  let identifierComponents = identifier.components(separatedBy: "-")
  guard identifierComponents.count == 2 else {
    return nil
  }
  self.init(model: identifierComponents[0], serialNumber: identifierComponents[1],
    reusable: reusable)
}
~~~

> When writing initializers, make the designated initializers non-failable and have them set all the properties. Then your convenience initializers can have the failiable logic and delegate the actual initialization to the designated initializer

## Subclassing

### Differences from Objective-C

* Objective-C will automatically initialize all properties to an empty-ish value, such as NO or 0 or nil. Bottom line: this code is capable of creating a fully initialized instance.

* Swift does not initialize properties automatically to empty values; it only initializes optional typed properties automatically to nil

* programmers are responsible for defining initial values for all non-optional stored properties; otherwise the Swift compiler will complain

### Adding Properties to Subclasses

~~~swift
class Tank: RocketComponent {
  let encasingMaterial: String
}
~~~

> You have three options to fix the compiler error:

1. Add a designated initializer that calls or overrides the designated initializer for the superclass RocketComponent.

2. Add a convenience initializer that calls the designated initializer for the superclass RocketComponent.

3. Add a default value for the stored property.

### Using Inherited Initializers

#### Adding Designated Initializers to Subclasses

~~~swift
init(model: String, serialNumber: String, reusable: Bool, encasingMaterial: String) {
  self.model = model
  self.serialNumber = serialNumber
  self.reusable = reusable
  self.encasingMaterial = encasingMaterial
}
~~~

> The codes above will not be compiled

* In Swift, a subclass can only initialize properties it introduces. Subclasses cannot initialize properties introduced by superclasses. Because of this, a subclass designated initializer must delegate up to a superclass designated initializer to get all of the superclass properties initialized

~~~swift
// Init #2a - Designated
init(model: String, serialNumber: String, reusable: Bool, encasingMaterial: String) {
  self.encasingMaterial = encasingMaterial
  super.init(model: model, serialNumber: serialNumber, reusable: reusable)
}
~~~

> The codes above will be compiled

1. Initialize the class’s own properties
2. Delegate the rest of the work up to the superclass designated initializer

### Two-Phase Initialization Up a Class Hierarchy

~~~swift
// Init #2a - Designated
init(model: String, serialNumber: String, reusable: Bool, encasingMaterial: String) {
  super.init(model: model, serialNumber: serialNumber, reusable: reusable)
  self.encasingMaterial = encasingMaterial
}
~~~

> This fails to compile because the designated initializer is not initializing all the stored properties this subclass introduces during phase 1

~~~swift
// Init #2a - Designated
init(model: String, serialNumber: String, reusable: Bool, encasingMaterial: String) {
  self.encasingMaterial = encasingMaterial
  self.model = model + "-X"
  super.init(model: model, serialNumber: serialNumber, reusable: reusable)
}
~~~

> This errors out because the subclass designated initializer is not allowed to initialize any properties not introduced by the same subclass

~~~swift
// Init #2a - Designated
init(model: String, serialNumber: String, reusable: Bool, encasingMaterial: String) {
  self.encasingMaterial = encasingMaterial
  super.init(model: model, serialNumber: serialNumber, reusable: reusable)
}
~~~

> correct codes

### The Initialization Funnel

![initialization1](/Img/initializationFunnel1.png)

![initialization2](/Img/initializationFunnel2.png)

![initialization3](/Img/initializationFunnel3.png)

### Delegating Up the Funnel

~~~swift
class LiquidTank: Tank {
  let liquidType: String

  // Init #3a - Designated
  init(model: String, serialNumber: String, reusable: Bool,
      encasingMaterial: String, liquidType: String) {
    self.liquidType = liquidType
    super.init(model: model, serialNumber: serialNumber, reusable: reusable,
      encasingMaterial: encasingMaterial)
  }
  // Init #3b - Convenience
  convenience init(model: String, serialNumberInt: Int, reusable: Bool,
  encasingMaterial: String, liquidType: String) {
  let serialNumber = String(serialNumberInt)
  self.init(model: model, serialNumber: serialNumber, reusable: reusable,
    encasingMaterial: encasingMaterial, liquidType: liquidType)
  }

  // Init #3c - Convenience
  convenience init(model: String, serialNumberInt: Int, reusable: Int,
  encasingMaterial: String, liquidType: String) {
    let reusable = reusable > 0
    self.init(model: model, serialNumberInt: serialNumberInt, reusable: reusable,
      encasingMaterial: encasingMaterial, liquidType: liquidType)
  }
}
~~~

### Re-inheriting Initializers

~~~swift
// Init #2b - Designated
override init(model: String, serialNumber: String, reusable: Bool) {
  self.encasingMaterial = "Aluminum"
  super.init(model: model, serialNumber: serialNumber, reusable: reusable)
}
~~~

> subclasses stop inheriting initializers once they define their own designated initializer

~~~swift
// Init #3d - Designated
override init(model: String, serialNumber: String, reusable: Bool) {
  self.liquidType = "LOX"
  super.init(model: model, serialNumber: serialNumber,
    reusable: reusable, encasingMaterial: "Aluminum")
}

// Init #3e - Designated
override init(model: String, serialNumber: String, reusable: Bool,
    encasingMaterial: String) {
  self.liquidType = "LOX"
  super.init(model: model, serialNumber: serialNumber, reusable:
    reusable, encasingMaterial: encasingMaterial)
}
~~~

~~~swift
let fuelTank = Tank(model: "Athena", serialNumber:"003", reusable: true)
let liquidOxygenTank = Tank(identifier: "LOX-012", reusable: true)
~~~

### Overriding Using Convenience Initializers

~~~swift
// Init #3d - Convenience
convenience override init(model: String, serialNumber: String, reusable: Bool) {
  self.init(model: model, serialNumber: serialNumber, reusable: reusable,
    encasingMaterial: "Aluminum", liquidType: "LOX")
}

// Init #3e - Convenience
convenience override init(model: String, serialNumber: String, reusable: Bool,
    encasingMaterial: String) {
  self.init(model: model, serialNumber: serialNumber,
    reusable: reusable, encasingMaterial: "Aluminum")
}
~~~

> There is one downside to overriding superclass designated initializers with subclass designated initializers. If the subclass designated initializer has logic, you can’t delegate to it from a convenience initializer. Instead, you can override a superclass’s designated initializer with a convenience initializer; this allows you to delegate to the subclass’s designated initializer logic. You’ll try this next.

### Failing and Throwing Strategy With Inheritance

~~~swift
// Init #3f - Convenience
convenience init?(identifier: String, reusable: Bool, encasingMaterial: String,
    liquidType: String) {
  let identifierComponents = identifier.components(separatedBy: "-")
  guard identifierComponents.count == 2 else {
    return nil
  }
  self.init(model: identifierComponents[0], serialNumber: identifierComponents[1],
    reusable: reusable, encasingMaterial: encasingMaterial, liquidType: liquidType)
}
~~~

