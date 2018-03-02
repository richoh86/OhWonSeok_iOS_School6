# Automatic Reference Counting

## Memory Management

- 명시적 해제 : 모든것을 개발자가 관리함
- 가비지콜렉터 : 가비지 콜렉터가 수시로 확인해서 안쓰는 객체를 해제
- reference counting: ownerShip 정책에 의해 객체의 해제 여부를 결정

### Reference counting (object-c)

~~~
NSString *str1 = [[NSString alloc] init];
NSString *str2 = [str1 retain];
NSString *str3 = str2;
[str1 release];
[str2 release];
~~~ 
1. str1에 인스턴스를 생성 
2. str2에 str1의 ownership retain
3. str3이 str2를 할당
4. **str1 release - 해제**
5. **str2 release - 해제**

>  기존에 object-c 에서는 개발자가 직접 객체를 해제하는 코드까지 구현했어야 한다

~~~
- (id)init{
retainCount = 1;  }
 - (id)retain{
     retainCount += 1;
return self;  }
 - (void)init{
     retainCount -= 1;
     if(retainCount == 0)
[self dealloc];  }
~~~
> reference counting 로직을 나타내는 코드이며, ownership을 가진 인스턴스를 카운트하는 로직 +/- 가 가능하다
> 그리고, 카운트가 0인 경우 객체가 해제된다

- 인스턴스 객체의 owner만이 해당 인스턴스에 대해서 해제에 대한 책임을 진다
- 오너쉽을 가진 객체만 reference counting이 증가한다

~~~
NSString *str1 = [[NSString alloc] init];
NSString *str2 = [[NSString alloc] init];
NSString *str3 = [[NSString alloc] init];
str2 = [[NSString alloc] init];
[str1 release];
[str2 release];
[str3 release];
~~~

> 위 코드에서 str2의 경우 2개의 인스턴스가 heap 영역에 적재된다

> str2 두번째에서 적재된 인스턴스는 해제되지 않은 상태로 heap 영역에 남게된다

### Apple의 ARC 도입 이유

- 앱의 비정상 종료 원인 중 많은 부분이 메모리 문제 
- 메모리 관리는 애플의 앱 스토어 업로드 승인 거부(Rejection)의 대다수 원인 중 하나
- 많은 개발자들이 수동적인 (retain/release) 메모리 관리로 어려움을 겪음 
- retain/release 로 코드 복잡도가 증가.

> 결국에는 ARC가 자동으로 메모리 관리를 해주기 때문에 개발 환경이 더 나아졌다


### ARC 규칙

- 구조체내의 객체 포인트를 사용할 수 없다 
- id나 void * type을 직접 형변환 시킬 수 없다 
- NSAutoreleasePool 객체를 사용할수 없다
- retain, release, retainCount, autorelease, dealloc을 직접 호출 할 수 없다

### Strong & weak 키워드

> Swift에서는 기본적으로 Strong 키워드로 변수가 선언된다 (Strong 키워드를 쓰지 않더라도)
 
~~~
var p1:Person
var p2:Person

p1 = Person()
p2 = p1
~~~
> 위 코드의 경우 p1과 p2가 모두 1개의 객체를 강하게(Strong) 참조하고 있기 때문에 둘다 소유권을 가지고 있으며,
> 할당 될 때마다 reference count는 증가한다

~~~
var p1:Person
weak var p2:Person

p1 = Person()
p2 = p1
~~~

> 위 코드의 경우 p1은 1개의 객체를 강하게(Strong)하게 참조하기 때문에 소유권을 가지고 있지만,
> p2의 경우 약한(weak) 참조를 하고 있기 때문에 소유권을 가지고 있지 않다

> 따라서, Person 객체의 reference count는 p2가 참조만 하기 때문에 증가하지 않고 그대로 1이다

~~~
weak var p2:Person

p2 = Person()
~~~
> 만약 약한 참조로 만든 p2에 객체를 생성하고 할당한다면 reference count는 증가시키지 않고 reference count가
> 0인 객체는 자동으로 해제되기 때문에 p2는 곧 nil 값을 가지게 된다

### weak pointer의 사용 이유

- 순환 참조를 막기위해서
- Autorelease pool을 대신해서 자동 해제가 필요한 경우
- view의 strong 참조 때문에

~~~
Unowned : 소유권이 없는 참조임을 나타내는 지시어

Optional 차이

1. Unowned : 절대 nil이 아니다.
2. Weak : nil 일수도 있다
~~~
 