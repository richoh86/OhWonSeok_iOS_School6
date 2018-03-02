# Container View Controller

> View Controller의 Container역할을 하는 View Controller

> View Controller 간의 구조를 잡는 역할을 한다

> 일반적으로 Root View를 가지고 있지 않고,  
View Controller를 Sub View Controller로 가지고 있다.

1. NavigationController

2. UITabbarController

3. UISplitViewController

## Navigation Controller

> Navigation Controller의 활용은 아이폰 setting(설정) 화면에서도 확인 가능합니다

![](/Img/navi1.png "navi1")

> UINavigationController Class

> Navigation Controller는 다른 뷰컨트롤들을 스택으로 관리한다

![](/Img/navi2.png "navi2")

> 아래 시계 앱에서도 Navigation Controller를 활용하고 있으며, 이미지는 내부 뷰의 구조를 보여주고 있다

![](/Img/navi3.png "navi3")

> Navigation Controller는 스토리보드에서 선택된 뷰컨트롤로의 Navigation Controller로 설정할 수 있다
> 방법은 아래 순서와 같다 

1. ViewController 선택
2. Editor -> Embed in -> Navigation Controller 선택
3. Navigation Controller 지정

### Navigation Bar

> 네비게이션 인터페이스를 관리하는 뷰

> navigation bar의 외관은 customize할 수 있지만,
> frame, bounds, or alpha values는 직접 바꿀 수 없다

![](/Img/navib1.png "navib1")

> 위 이미지는 일반적으로 볼 수 있는 navigation bar의 모습이다

![](/Img/navib3.png "navib3")

> 기본적으로 navigation bar는 stack 구조로 되어 있으며, popNavigationItemAnimated, pushNavigationItem 메소드를 통해서 stack에 쌓여있는 기존 Item을 가장 위에서부터 지우거나 신규 Item을
가장 위 부터 쌓을 수 있다 

![](/Img/navib2.png "navib2")

> navigation bar 내부 구조의 모습이며, 커스터마이즈가 가능하다

1. left: backBarButtonItem, leftBarButtonItem
2. Center: titleView
3. Right: rightBarButtonItem

![](/Img/navib4.png "navib4")

> tintColor를 변경 할 수도 있으며, 텍스트의 포지션도 변경이 가능하다