# UITableView

## Definition

> 하나의 열을 가지고 커스텀한 셀을 만들어서 데이터를 보여줄 수 있는 리스트 형태의 뷰

>> 카카오톡 앱을 사용해보더라도 테이블 뷰는 아주 흔하게 볼 수 있는 뷰라고 할 수 있다 
TableView의 Style은 Plain 과 Grouped으로 2가지가 있다


### 1. Plain Table View

![tableview](/Img/tableview.png "tableview")

 - 여러개의 Section을 가질수 있다
 - 한 Section에는 여러개의 Row를 포함하고 있다.
 - 각각의 Section에는 Section을 표시하는 header, Footer title을 사용할수 있다
 - Section을 빠르게 검색할수 있는 네비게이터 바를 index list 라고 부른다

### 2. Grouped Table View

위 이미지에서 본 TableView의 스타일이 기본 plain 이며,
아래 이미지는 **TableView의 grouped** 스타일이다

![tableviewGrouped](/Img/grouped.png "tableviewGrouped")

- grouped Table View는 각 section을 group 형태로 나타낸다
- 데이터의 디테일한 정보를 표현할 때 많이 사용한다

## Protocol

> Delegate Pattern에서는 프로토콜이라는 개념이 나왔었는데, 테이블 뷰에서도 프로토콜 2가지를 사용해서 테이블 뷰의
원하는 형태와 row 수량을 설정해 줄 수 있다

 - DataSource
 - Delegate
 
 
### DataSource
> 프로토콜을 사용하여 테이블뷰에서 보여줄 데이터를 관리할 대리인의 역할을 정의해 둔것

@requires

- 테이블 뷰의 각 섹션별 열의 개수를 설정 - Row별 Cell객체

@optional

- 테이블 뷰 섹션의 개수를 설정  

---
> DataSource 함수

~~~swift
public protocol UITableViewDataSource : NSObjectProtocol {
  @available(iOS 2.0, *)
     public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     // Row display. Implementers should *always* try to reuse cells by setting each cell's
 reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
     // Cell gets various attributes set automatically based on table (separators) and data source
 (accessory views, editing controls)
     @available(iOS 2.0, *)
     public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
 UITableViewCell
     @available(iOS 2.0, *)
     optional public func numberOfSections(in tableView: UITableView) -> Int // Default is 1 if
 not implemented
     @available(iOS 2.0, *)
     optional public func tableView(_ tableView: UITableView, titleForHeaderInSection section:
 Int) -> String? // fixed font style. use custom view (UILabel) if you want something different
     @available(iOS 2.0, *)
     optional public func tableView(_ tableView: UITableView, titleForFooterInSection section:
 Int) -> String?
~~~

### Delegate

> 프로토콜을 사용하여 테이블뷰의 대리자로써의 수행할 수 있는 역할들을 정의해 둔 것

- 헤더 또는 풋터의 높이를 설정 : Variable height support
- 헤더 또는 풋터 뷰를 제공 : Section Informations.
- 셀을 선택하였을 때 수행할 동작 관리 : Selection
- 셀의 삭제 될 때의 동작 등의 관리 : Editing

---

> Delegate 함수

~~~swift
public protocol UITableViewDelegate : NSObjectProtocol, UIScrollViewDelegate {
     // Display customization
     @available(iOS 2.0, *)
     optional public func tableView(_ tableView: UITableView, willDisplay cell:
 UITableViewCell, forRowAt indexPath: IndexPath)
     @available(iOS 6.0, *)
     optional public func tableView(_ tableView: UITableView, willDisplayHeaderView view:
 UIView, forSection section: Int)
...
     // Variable height support
     @available(iOS 2.0, *)
     optional public func tableView(_ tableView: UITableView, heightForRowAt indexPath:
 IndexPath) -> CGFloat
     @available(iOS 2.0, *)
     optional public func tableView(_ tableView: UITableView, heightForHeaderInSection
 section: Int) -> CGFloat
     @available(iOS 2.0, *)
     optional public func tableView(_ tableView: UITableView, heightForFooterInSection
 section: Int) -> CGFloat
~~~

### Index Path

 - cell의 위치를 나타낼 Data Type으로 Secion정보와 해당 섹션에서의 열(Row) 정보를 가지고 있다

> Index Path Extension

~~~swift
extension IndexPath {
    /// Initialize for use with `UITableView` or `UICollectionVie
    public init(row: Int, section: Int)
    /// The section of this index path, when used with `UITableVi
    ///
    /// - precondition: The index path must have exactly two elem
    public var section: Int
    /// The row of this index path, when used with `UITableView`.
    ///
    /// - precondition: The index path must have exactly two elem
    public var row: Int
}
~~~

## TableView 만드는 순서

### 1. 테이블 UI 생성

- 스토리보드로 가서 원하는 뷰컨트롤러위에 TableView를 올리고 AutoLayOut을 설정해준다
- Table View Cell을 TableView 위에 올려서 만든다
- Table View Cell의 Identifier를 설정해준다 (보통 "이름 + cell"로 만들어준다)
- Table View를 해당 뷰컨트롤러에 DataSource와 Delegate를 설정해준다
(코드상으로는 datasource. = self, delegate = self로 구현 가능하다)

### 2. DataSource 함수 만들기 (section, row 수)

 - TableView의 section과 row수를 설정해 줄 수 있는 DataSource 함수를 선언하고 값을 설정한다

~~~swift
func tableView(_ tableView: UITableView,
numberOfRowsInSection section: Int) -> Int {
//섹션별 row의 갯수 리턴 코드 구현
}

func tableView(_ tableView: UITableView, cellForRowAt
indexPath: IndexPath) -> UITableViewCell { 
//cell 구현
}
~~~

### 3. 각 index path의 cell을 설정

- cell의 text에 indexPath의 row 숫자를 cell별로 넣어준다

~~~swift
func tableView(_ tableView: UITableView,  
cellForRowAt indexPath: IndexPath) -> UITableViewCell  {

//cell instance 가져오기
let cell = tableView.dequeueReusableCell(withIdentifier:
"Reuse ID", for: indexPath) 

//Cell Data 설정
cell.textLabel?.text = "\(indexPath.row)"

return cell }
~~~

> 테이블 뷰는 로우들이 매우 비슷한 모습을 가지고 있으며 만약 화면상에서 벗어나는 로우가 있다면 공통적인 레이아웃으로 Cell을 재사용해서 화면상에 보여준다 

>> 즉, 화면상으로 올라오는 cell들은 기존에 사용된 cell들이 화면 위로 사라지면서 다시 화면 아래로부터 재사용되어 보이게 되는 것이다

## Custom TableViewCell

> 테이뷸 셀은 커스텀하게 바꿔서 활용할 수 있다 만약 커스텀한 셀을 만들고 싶다면 먼저 Custom TableViewCell 파일을 만들어서 반드시 해당 셀의 subclass로 만들어줘야 한다

![tableviewCell](/Img/cell.png "tableviewCell")

**Content Views**

> Cell에는 Content View가 있으며 이곳에 text나 이미지를 올려서 표현할 수 있다 

- textLabel
- detailTextLabel
- imageView

![tableViewContent](/Img/accessory.png "tableViewContent")

**Accessory Views**

> Cell에는 Accessory View 라는 것도 존재하며 아래 Accessory 들을 넣어 줄 수 있다

~~~swift
typedef NS_ENUM(NSInteger,
UITableViewCellAccessoryType) {
    UITableViewCellAccessoryNone,
    UITableViewCellAccessoryDisclosureIndicator,
    UITableViewCellAccessoryDetailDisclosureButton
    UITableViewCellAccessoryCheckmark,
    UITableViewCellAccessoryDetailButton
};
~~~














