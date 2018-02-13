# Application Life Cycle

## MVC Design Pattern

![](/Img/MVC.png "MVC")

> 위 이미지에서는 Model과 View가 Controller를 통해서 실행된다는 것을 설명해준다 

*M: Model*  *V: View* *C: Controller*

~~~
iOS FrameWorks는 MVC 와 Delegation 패턴에 의존해서 실행되며, MVC의 경우 다른 프로그래밍 언어에서도 이미 
많이 활용되고 있다
~~~

## The Main Function

~~~
C 기반의 앱이 시작 될 때 main function이 호출되는데 이는 iOS 앱에서도 마찬가지이다
단, Xcode에서는 기본 프로젝트를 생성할 때 아래 구현된 main function이 포함된다

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
 
int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
~~~

> 여기서  UIApplicationMain function은 core object를 만들고, user interface를 
storyboard file로 부터 로딩시키고 개발자의 커스텀 코드를 호출한다 마지막으로 app이 실행되는 
루프에 놓이도록 한다 따라서, 개발자는 storyboard file과 커스터마이즈 된 initialization code만 구현하면 된다

## The Structure of an App

![](/Img/StructureOfApp.png "StructureOfApp")

> UIApplication은 시스템과 다른 object들 간의 상호작용을 용이하게 하는 역할을 하며, 위 이미지에서도 MVC 패턴을 iOS App이 사용한다는 것을 보여준다 MVC 패턴은 App의 데이터와 비지니스 로직을 데이터의 시각적인 표현을 하는 부분을 분리시켜준다 이 architecture는 스크린 사이즈가 다른 디바이스들에서도 App을 정상적으로 실행시킬수 있도록 해준다

## The Main Run Loop

![](/Img/MainRunLoop.png "MainRunLoop")

> 위 architecture는 app에서 어떻게 사용자의 action에 대한 event를 전달 받는지에 대해서 보여준다 시스템에 의해서 발생된 이벤트는 UIKit이 설정 해둔 port로 먼저 전달된다 전달된 이벤트들은 대기 중인 상태가 되며, 대기 중 상태의 이벤트들은 하나씩 Main run loop 라는 곳에서 실행된다 이 때 UIApplication Object가 처음으로 해당 Object를 받아서 어떻게 실행되야 할지 결정을 내려준다 보통 터치 이벤트는 main window object로 디스패치 된다

## Execution States for Apps

 ![](/Img/ExecutionState.png "ExecutionState")
 
 > App이 작동 중인 상황에서도 상태가 달라 질 수 있다 예를들면, 특정 App을 이용하고 있을 때 전화가 걸려오거나, 홈버튼을 누르는 등의 방해 동작으로 인해서 상태는 달라진다 상태는 다음과 같이 구분할 수 있다
 
 * **Not running**: App이 아직 시작되지 않았거나, 종료된 상태다
 
 * **Inactive**: App이 현재 작동 중이긴 하나 이벤트를 받을 수 있는 상태가 아니다 
 
 * **Active**: App이 작동 중인 상태며, 가장 일반적인 상태다

 * **Background**: 백그라운드 상태에서 코드를 실행하고 있는 상태이며, Suspended 상태로 가는 중인 상태로 볼 수 있다
 
 * **Suspended**: 백그라운드에 있는 상태이긴 하지만, 코드를 실행하지는 않는다 그리고 메모리는 적재된 상태지만 마찬가지로 코드를 실행하지는 않는다
 
 
~~~
아래 생명주기 함수들은 App 작동 시점에 따라서 호출되며, 해당 함수들은 오버라이드해서 활용가능하다

application:willFinishLaunchingWithOptions
application:didFinishLaunchingWithOptions
applicationDidBecomeActive
applicationWillResignActive
applicationDidEnterBackground
applicationWillEnterForeground
applicationWillTerminate

~~~