# Design Patterns on iOS using Swift

> 디자인 패턴은 소프트웨어 디자인에서 발생하는 공통적인 문제를 해결하기 위한 재사용이 가능한 솔루션입니다

- 디자인 패턴의 템플릿들은 개발자가 이해하기 쉽고, 재사용이 가능한 코드를 쓰는데 도움을 줍니다.
- 또한 코드를 수정하거나, 기존 코드를 다른 코드로 대체하는 작업들이 더 용이할 수 있도록 도와줍니다.

## MVC - The King of Design Pattern

> Model-View-Controller(MVC)는 가장 많이 사용되고 있는 디자인 패턴입니다. 이 디자인 패턴은 어플리케이션에서의 일반적인 역할에 따라서 오브젝트는 분류하고 역할에 따라서 코드를 깔끔하게 분리해줍니다. 

![MVC_1](/Img/MVC_1.png "MVC_1")

### Model

어플리케이션 데이터를 가지고 있으며 어떻게 데이터를 조작할 것인지 정의합니다

### View

위 모델의 시각적인 표현을 담당하는 오브젝트이며, 유저와의 상호작용을 컨트롤합니다
(all the UIView derived objects)

### Controller

모델과 뷰의 모든 작업을 지휘하는 중재자 역할을 합니다.

- 모델로 부터 데이터를 가져오고 뷰에 해당 데이터를 보여주는 역할
- 유저의 이벤트를 받아서 처리하고 필요한 경우 데이터를 변경하는 역할

## The Singleton Pattern

> 싱글턴 패턴은 단 하나의 주어진 클래스의 인스턴스만 존재하도록 만들어주며, 해당 인스턴스에 global acccess(접근)이 가능하도록 해줍니다.

### Example
- UserDefaults.standard
- UIApplication.shared
- UIScreen.main
- FileManager.default

### What Should You Be Careful About?

싱글턴 패턴은 과도하게 사용하면 안된다?

싱글턴 패턴을 활용해서 단순히 ViewController에서 다른 ViewController로 데이터를 옮기는 작업을 하기보다는,
이런 작업은 모델에 있는 initializer와 property를 활용해서 작업하는 것이 좋습니다.

가장 흔한 싱글턴 패턴의 문제는 바로 테스트에서 나타납니다. 만약 상태값이 글로벌 오브젝트로 저장되어 있다면, 테스트시 순서가 문제가 될 수 있으며, 해당 싱글턴 패턴을 따라가기 어려울 수 있습니다. 따라서, 불필요한 싱글턴 패턴은 테스트 시 문제가 발생할 수 있습니다.

### Custom Singleton
~~~swift
final class LibraryAPI {
  // 1
  static let shared = LibraryAPI()
  // 2
  private init() {

  }
}
~~~

## The Facade Design Pattern

> Facade 디자인 패턴은 복잡한 하위 시스템들을 한개의 채널로 관리 할 수 있는 single interface를 제공합니다.

![Facade_1](/Img/Facade_1.png "Facade_1")

이 패턴은 많은 숫자의 클래스를 활용해야 할 때 이상적이며, 특히 사용자체가 복잡하거나 이해하기 어려울 때 사용하면 좋습니다.

![LibraryAPI](/Img/LibraryAPI.png "LibraryAPI")

위 LibraryAPI를 예시로 살펴보면,

API를 호출할 때, 직접적으로 다른 코드에서 PersistencyManager와 HTTPClient로 접근하는 것이 아니라, LibraryAPI를 통해서 호출을 하는 것입니다. 여기서 LibraryAPI의 인스턴스를 활용하면, 다른 코드에서 반복적으로
PersistencyManager, HTTPClient 와 같은 세부적인 단위의 API들에 직접적으로 접근할 필요가 없어집니다.

### SampleCode

LibraryAPI.swift 파일에 subsystem 클래스의 인스턴스를 선언해서 하나의 파일에서 모든 API 호출을 관리합니다

~~~swift
private let persistencyManager = PersistencyManager()
private let httpClient = HTTPClient()
private let isOnline = false

func getAlbums() -> [Album] {
  return persistencyManager.getAlbums()    
}
  
func addAlbum(_ album: Album, at index: Int) {
  persistencyManager.addAlbum(album, at: index)
  if isOnline {
    httpClient.postRequest("/api/addAlbum", body: album.description)
  }  
}
  
func deleteAlbum(at index: Int) {
  persistencyManager.deleteAlbum(at: index)
  if isOnline {
    httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
  }   
}
~~~


## Decorator Design Pattern

> Decorator 디자인 패턴은 별도의 코드를 수정하지 않고도 역동적으로 특정 작업을 위한 행동과 책임감을 오브젝트에 추가시키는 것입니다. Swift에서는 2가지 패턴이 존재합니다 

### 1. Extensions

> subclass를 하지 않고 원하는 클래스에 extensions을 활용하여 새로운 기능을 추가 시킬 수 있습니다. 

클래스 Album의 기능을 추가할 수 있도록 확장하는 코드
(해당 클래스 brace "{}" 외부에 선언)

~~~swift
extension Album {
  var tableRepresentation: [AlbumData] {
    return [
      ("Artist", artist),
      ("Album", title),
      ("Genre", genre),
      ("Year", year)
    ]
  }
}
~~~ 

### 2. Delegation

> Delegation은 오브젝트가 오브젝트와 소통하여 정보를 주고 받을 수 있는 메커니즘의 디자인 패턴입니다.

가장 많이 사용되고 있는 UITableView에서도
UITableViewDataSource 프로토콜을 채택하여 Delegation 패턴을 활용합니다

1. Table -> row 수, cell data 등의 정보를 물어보고
2. DataSource -> 해당 정보를 확인하여 보내줍니다.

~~~swift
extension ViewController: UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  guard let albumData = currentAlbumData else {
    return 0
  }
  return albumData.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
  if let albumData = currentAlbumData {
    let row = indexPath.row
    cell.textLabel!.text = albumData[row].title
    cell.detailTextLabel!.text = albumData[row].value
  }
  return cell
}

}
~~~

위 코드를 보면 해당 함수들이 TableView에서 요구하는 정보들을 보내주도록 정의되어 있는 것을 확인 가능합니다.
