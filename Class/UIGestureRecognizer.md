# UIGestureRecognizer

* 사용자의 입력을 전달받을 수 있는 방법을 제공

* Tap, Pinch, Rotation, Swipe, Pan(drag), Edge Pan, Long, Press 등을 인지하는 각각의 서브클래스 존재

* View위에 얹어 액션을 핸들링

## UIGestureRecognizer 종류

<p align = "center"><img width="300" height="300" src="/Img/g1.png"><img width="300" height="300" src="/Img/g2.png"></p>

## Sample Code
 
> 아래 코드는 gesture를 view에 넣어서 #selector를 활용하여 뷰컨트롤러에 액션 함수를 구현한 것입니다 

~~~swift
let tapGesture = UITapGestureRecognizer(target: self,
                             action: #selector(ViewController.tapAction(_:)))

self.view.addGestureRecognizer(tapGesture)

//ViewController내 존재 하는 함수
@objc func tapAction(_ sender:UITapGestureRecognizer) {
}
~~~

## StoryBoard View 생성 및 연결

> 생성한 View 위에 gesture view 를 드래그하여 	놓으면 아래 이미지와 같이 뷰컨트롤러 위에 gesture 아이콘이 생성되고
왼쪽 inspector에서도 gesture가 Exit 다음에 추가된 것을 확인할 수 있습니다

![g3](/Img/g3.png "g3")

- 아래 코드는 스토리보드에서 뷰컨트롤러로 UITapGestureRecognizer를 @IBOutlet으로 연결하고
@IBAction으로 액션 함수를 만들어 준 것입니다 

~~~swift
    @IBOutlet var gesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer){
        
        print("tap 함수 호출")
    }
~~~

## UITapGestureRecognizerDelegate

 - 아래 코드는 가장 많이 사용하는 Delegate 메소드 입니다

~~~swift
	func gestureRecognizer(_ gestureRecognizer:	UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {	//터치된 포인트가 inView위치에 어느 좌표에 해당되는지 표시	print("xposition", touch.location(in: touch.view).x)	//터치가 일어난 시간 반환	print("touch timeStamp”,touch.timestamp)	//연속적으로 일어난 터치의 횟수	print("touch tapCount",touch.tapCount)	return true}
~~~