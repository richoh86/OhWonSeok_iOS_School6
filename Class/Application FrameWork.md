# Application FrameWork

## Definition

> 애플리케이션 프레임워크(Application Framework)는 프로그래밍에서 특정 운영 체제를 위한 응용 프로그램 표준 구조를 구현하는 클래스와 라이브러리 모임이다. 간단하게 프레임워크라고도 부른다

~~~
1. 재사용 가능한 코드를 프레임워크로 통합
-> 표준코드를 다시 만들지 않아도 된다

2. 프레임워크 구현은 객체 지향 프로그래밍 기법이 사용되고 있기 때문에 
프레임워크의 클래스를 상속 받아서 활용할 수 있다
~~~

## UI Framework

### UIKit

> Cocoa Touch Framework에 추가된 UI를 구현할 수 있는 기능이 모여있는 Framework

![] (/Img/classH.png)

~~~
모든 클래스를 보여주는 자료의 이미지는 아니지만 가장 많이 사용되는 클래스 위주로 구성되어 있으며,
상위 클래스와 하위클래스의 구조를 기본적으로 기억하고 있으면 좋다 
~~~

#### UIResponder

> An abstract interface for responding to and handling events

~~~
open func becomeFirstResponder() -> Bool
open func resignFirstResponder() -> Bool
open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
open func touchesCancelled(_ touches: Set<UITouch>, with event:
UIEvent?)
~~~
#### UIView

> An object that manages the content for a rectangular area on the screen

~~~
public init(frame: CGRect)
open var tag: Int
open var layer: CALayer { get }
open var frame: CGRect
open var bounds: CGRect
open var isMultipleTouchEnabled: Bool
open var clipsToBounds: Bool
open var backgroundColor: UIColor?
open var isHidden: Bool
open var contentMode: UIViewContentMode
open func addSubview(_ view: UIView)
open func insertSubview(_ view: UIView, at index: Int)
open func removeFromSuperview()
open func layoutIfNeeded()
~~~
#### UILabel

> A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose

~~~
open var text: String? // default is nil
open var font: UIFont! // default is nil (system font 17 plain)
open var textColor: UIColor! // default is nil (text draws black)
open var shadowColor: UIColor? // default is nil (no shadow)
open var shadowOffset: CGSize // default is CGSizeMake(0, -1) -- a top shadow
open var textAlignment: NSTextAlignment // default is NSTextAlignmentNatural (before iOS 9, the default was NSTextAlignmentLeft)
open var lineBreakMode: NSLineBreakMode // default is NSLineBreakByTruncatingTail. used for single and multiple lines of text
...
~~~
#### UIImageView

> An object that displays a single image or a sequence of animated images in your interface

~~~
public init(image: UIImage?)
@available(iOS 3.0, *)
public init(image: UIImage?, highlightedImage: UIImage?)
open var image: UIImage? // default is nil
@available(iOS 3.0, *)
open var highlightedImage: UIImage? // default is nil
open var isUserInteractionEnabled: Bool // default is NO
@available(iOS 3.0, *)
open var isHighlighted: Bool // default is NO
~~~

#### UIControl

> The base class for controls, which are visual elements that convey a specific action or intention in response to user interactions

~~~
open var isEnabled: Bool // default is YES. if NO, ignores touch events and subclasses may draw differently
open var isSelected: Bool // default is NO may be used by some subclasses or by application

// 가장 많이 사용되는 함수
open func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)
~~~

#### UIButton

> A control that executes your custom code in response to user interactions

~~~
open func setTitle(_ title: String?, for state: UIControlState) // default is nil. title is assumed to be single line
open func titleColor(for state: UIControlState) -> UIColor?
@available(iOS 3.0, *)
open var titleLabel: UILabel? { get }
~~~



