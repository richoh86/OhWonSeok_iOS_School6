# Optional

## Definition
~~~
Type Safety 를 위한 컴파일러 수준의 nil 체크

Swift의 중요한 특징은 safety이며, nil 인 변수선언을 해야할 경우 optional을 사용한다 
~~~

* 	nil 이란?

> 변수 선언 후에 초기화를 하지 않은 상태

~~~
예시)
class Person{
    var name:String
    init(name:String) {
        self.name = name
    }
}

let person2:Person
print(person2.name)
~~~

## Optional Type

### '!' 의 의미는 해당 변수에 값이 존재한다
### '?' 의 의미는 해당 변수에 값이 있을 수도 있고,nil 일수도 있다


## Unwrapping

### Forced Unwrapping

> 파라미터 입력값이 nil 값이 아닌 경우의 if 문을 구현했기 때문에 강제로 optionalStr 값을 '!' 를 사용해서 unwrapping 해야한다 

~~~
func testFuc(optionalStr:String?)
{
    if optionalStr != nil
    {
       let unwrapStr:String = optionalStr!
       print(unwrapStr)
} }
~~~

### Optional Binding

> 선택적 해제를 뜻하며 if 문을 통해 파라미터가 nil 값이 아닌 String 이라고 증명되면 if 구문 안 statement를 실행한다 (예시1)

~~~
예시1)
func testFuc(optionalStr:String?)
{
    if let unwrapStr:String = optionalStr
    {
       print(unwrapStr)
    }
}
예시2)
 func isNumber(inputNum:String) -> Bool
      {
          if let firstNumber = Int(inputNum)
          {
             print(“\(firstNumber)”)
return true
}else {
return false
} }
~~~

### Early Exit
> guard 조건값 else
{
//조건값이 거짓일때 실행
//종료 조건이 항상 필요 }

~~~
func testFuc(optionalStr:String?)
    {
        guard let unwrapStr:String = optionalStr  else
        {
return
}
        print(unwrapStr)
    }
~~~

