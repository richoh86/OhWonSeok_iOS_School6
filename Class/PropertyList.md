# Property list

- 심플한 “파일” 저장 방법 중 하나
- Key,Value구조로 데이터 저장
- File 형태로 저장되다 보니 외부에서 Access가능(보안 취약)

## File location

- 파일이 저장되는곳 Bundle & Documents 폴더 
- Bundle은 프로젝트에 추가된 Resorce가 모인 곳
- 프로그램이 실행되며 저장하는 파일은 Documents폴더에 저장 된다.

> plist파일의 데이터만 불러오는 역할은 Bundle을 통해서, plist파일에 데이터를 쓰고 불러오는 역할은 Documents폴더 에 저장된 파일로!

## Plist file In Bundle

1. bundle에 있는 파일 Path 가져오기
2. Path를 통해 객체로 변환, 데이터 불러오기
3. 사용

 > ***Bundle*** : 실행코드, 이미지, 사운드, nib 파일, 프레임워크, 설정파일 등 코드와 리소스가 모여있는 file system내의 Directory

```swift
func loadPlist(fileName:String){//Pathlet bundlePath = Bundle.main.path(forResource: fileName, ofType: "plist")//Dataif let data = try? Data(contentsOf: URL(fileURLWithPath: bundlePath!)){//Dictionary
let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)print(dic)}}
```

## Plist file In Document

1. Document folder Path 찾기
2. Document folder에 plist 파일이 있는지 확인

> 만약 없다면 : bundle에 있는 파일 Document에 복사 

3. Path를 통해 Data인스턴스로 변환
4. PropertyListSerialization으로 Data를 컬렉션으로 변환
5. 컬렉션 데이터 가공 후 PropertyListSerialization로 Data 변환
6. 파일에 다시 저장

### 1. 파일 불러오기 (NSSearchPathForDirectoriesInDomains)
~~~swift
let rootPath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0]
 let fullPath:String = rootPath + "/" + fileName + ".plist"
~~~
### 2. Document folder에 파일 있는지 확인
```swift
if !FileManager.default.fileExists(atPath: fullPath)
{
}
```
### 3.bundle에 있는 파일 Document에 복사
```swift
if !FileManager.default.fileExists(atPath: fullPath)
{
 if let bundlePath:String = Bundle.main.path(forResource: fileName, ofType:“plist"){try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)}
}
```

### 4. Dictionary 인스턴스 불러오기

```swift
if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath))
{
do{
if var dic:[String:Any] = try PropertyListSerialization.propertyList(from: data,options: .mutableContainersAndLeaves, format: nil) as? [String:Any]
 {


 }
 }catch{

print("error")

 }
}
```

### 5. write(to)메소드를 통해 파일에 저장

```swift
if var dic:[String:Any] = try PropertyListSerialization.propertyList(from: data,options: .mutableContainersAndLeaves, format: nil) as? [String:Any]
dic.updateValue(3, forKey: "hoho")

let newData = try PropertyListSerialization.data(fromPropertyList: dic, 

try newData.write(to: URL(fileURLWithPath: fullPath))
format: .xml, options: 0)}
```

> 파일은 항상 새 파일로 덮어 쓰는 것이기 때문에 기존 데이터는 모두 사라지고 새로운 파일 기준으로 데이터가 보인다
> 이 점을 꼭 유의해서 사용해야 한다


