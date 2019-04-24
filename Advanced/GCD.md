## GCD (Grand Central Dispatch)

> 멀티코어 프로세스를 위한 Thread 프로그래밍을 OS에서 자동으로 관리 분배해주는 기능을 한다.
> 결론적으로 멀티코어 프로세스에 최적화된 어플리케이션을 만들기 위해 사용된다

- Swift에서는 Main(Serial)과 Global(Concurrent) 두 가지로 나뉘며, sync(동기) / async(비동기) 방식으로 처리 가능하다.

## Main Queue (= Serial Queue)

- Serial Queue에서는 먼저 들어온 Task를 먼저 실행한 후 이후 다음 Task를 수행한다
- main에서는 async (비동기)만 활용 가능 -> sync(동기) 사용시 dead-lock 발생

~~~swift
// A Task
DispatchQueue.main.async {
    for i in 1...5{
        print("\(i)A")
    }

    print("===============")
}

// B Task
DispatchQueue.main.async {
    for i in 1...5{
        print("\(i)B")
    }

    print("===============")
}
~~~

~~~
// console log

1A
2A
3A
4A
5A
===============
1B
2B
3B
4B
5B
===============

~~~

## Global Queue (= Concurrent Queue)

- Concurrent Queue에서는 여러 Task들을 동시에 수행한다
- global에서는 sync(동기)/async(비동기) 방식 모두 수행이 가능하다

~~~swift
// A Task와 B Task를 동시에 수행

// A Task
DispatchQueue.global().async {

    for i in 1...5{
        print("\(i)A")
    }

    print("================")
}

// B Task
DispatchQueue.global().async {

    for i in 1...5{
        print("\(i)B")
    }

    print("================")
}


for i in 101...105{
    print(i)
}
~~~

~~~
*console log

101
1B
1A
102
2A
2B
3A
103
104
4A
3B
5A
105
4B
================
5B
================
~~~

## Custom Queue

> Queue를 직접 만들어서 작업을 수행 시킬 수 있다

- 출력되는 결과는 위 내용에서 공유한 결과와 동일하다 (단, concurrent 출력되는 순서가 매번 다를 수 있다)

### Custom Serial Queue

~~~swift
// A task가 끝나야 B Task가 시작된다
let richQueue = DispatchQueue(label: "richSerial")

// A task
richQueue.async {
    for i in 1...5 {
        print("\(i)A")
    }

    print("===============")
}

// B task
richQueue.async {
    for i in 1...5 {
        print("\(i)B")
    }

    print("===============")
}

for i in 100...105{
    print(i)
}
~~~

### Custom Concurrent Queue

~~~swift
let richConcurrentQueue = DispatchQueue(label: "richConcurrent", qos: DispatchQoS.default, attributes: .concurrent)

// A Task
richConcurrentQueue.async {

    for i in 1...5 {
       print("\(i)A")
    }

    print("==============")
}

// B Task
richConcurrentQueue.async {

    for i in 1...5 {
        print("\(i)B")
    }

    print("==============")

}
~~~

## DispatchWorkItem

- 수행하고자하는 Task를 캡슐화해서 사용할 수 있도록 해준다

~~~swift
let richWorkItem = DispatchWorkItem {

    for i in 1...5 {
        print("DispatchWorkItem: \(i)")
    }

}

DispatchQueue.global().async(execute: richWorkItem)
~~~