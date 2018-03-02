# View Controller

## Genral View Controller

> 일반적인 View Controller의 형태

> 각 View Controller가 Root View를 가지고 있다

1. UIViewController = UIView 

2. UITableViewController = UITableView

3. UICollectionViewController = UICollectionView

### UIViewController Instance Load

 1. init
 
 ~~~
 let nextVC = NextViewController()
 
 nextVC.view.backgroundColor = UIColor.orange
 
 // 화면전환
 self.present(nextVC, animated: true, completion: nil)
 ~~~   
 
 2. xib (컨트롤러 이름과 xib 이름이 다를 경우 파라미터 입력)
 
 ~~~
 let nextVC = NextViewController(nibName: "NextViewController", bundle: nil)
 
 nextVC.view.backgroundColor = UIColor.orange
 
 // 화면전환
 self.present(nextVC, animated: true, completion: nil)
 ~~~
     
 3. storyboard를 통해서 인스턴스 생성
 
 ~~~       
 let storyboard = UIStoryboard(name: "Main", bundle: nil)
 
 let nextVC: NextViewController 
  = storyboard.instantiateViewController(withIdentifier: "NextViewController") 
  as! NextViewController
        
 // 화면전환
  self.present(nextVC, animated: true, completion: nil)
 ~~~
 
### Present Modally
 
 1. 화면전환: Present Modally
 > ViewController간의 화면전환
 
 **self.present(nextVC, animated: true, completion: nil)** 
 
 2. Animation - transition
 > 화면전환시 애니메이션 스타일을 4가지 옵션 중에 선택할 수 있다
 
 ~~~
 open var modalTransitionStyle: UIModalTransitionStyle
 
 public enum UIModalTransitionStyle : Int {

     case coverVertical

     case flipHorizontal

     case crossDissolve

     @available(iOS 3.2, *)
     case partialCurl
}
~~~

### Segue

* 앱의 인터페이스 흐름을 정의하는 데 사용

* Storyboard 파일 내 두 개의 ViewController사이의 화면전환을 정의

* Segue의 시작점은 button, tableView의 row, gesture등으로
시작하며 끝점은 전환되는 다음 ViewController이다

* segue는 일반적으로 다음 ViewController로 진행되는 것을 가르키나, unwind segue를 통해 ViewController를 닫는 역할도 할수 있다

![](/Img/segue1.png "segue")

> 위 예제는 버튼을 다음 뷰 컨트롤러로 segue를 이용해 연결

![](/Img/segue3.png "inspector")

> segue의 설정에서 storyboard segue 의 identifier를 mainToNext로 입력

![](/Img/segue2.png "segue function")

> segue 함수를 오버라이드 해서 segue를 활용하여 화면전환시 추가적으로 필요한 로직을 넣어줄 수 있다