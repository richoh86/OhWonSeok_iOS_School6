# User Default

## How to save data

1. 파일 저장 (Property List, SQLitef, 아카이빙)
2. iOS DataBase 이용 - Core Data
3. NetWork - Server DB 이용

## User Default

> 사용자의 정보를 저장하는 싱글톤 인스턴스

>> 간단한 사용자 정보를 저장/불러오기가 가능하게 만든 인스턴스


>>> 내부적으로 Plist 파일로 저장되어 보안이 강하지 않다.(필요에
따라 암호화 필요)

## Function & Property

~~~swift
open class var standard: UserDefaults { get }

//데이터 불러오기
open func object(forKey defaultName: String) 
-> Any? open func string(forKey defaultName: String) 
-> String? open func array(forKey defaultName: String) -> [Any]?

//데이터 저장하기
open func set(_ value: Any?, forKey defaultName: String)

//데이터 지우기
open func removeObject(forKey defaultName: String)
~~~

## Example

~~~swift
//*key값은 통일 시켜야 한다. //데이터 저장

UserDefaults.standard.set("joo", forKey: "userID") //데이터 불러오기

let aUser:String = UserDefaults.standard.object(forKey: "UserID") as! String
let sUser:String = UserDefaults.standard.string(forKey: "UserID")!
~~~