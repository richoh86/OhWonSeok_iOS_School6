# Data Structure & Algorithm

## Data Strucuture ( 자료구조 )

### Stack

> 요소가 들어오면 가장 위에 쌓이게 되고, 호출시 가장 마지막 요소가 먼저 호출된다.
>> 즉, (LIFO) Last In First Out가 특징이다. 

### Queue

> 요소 삽입시 큐 가장 뒤에 들어가고 요소를 다시 호출시 해당 큐에 가장 처음으로 들어온 요소부터 호출된다. 
>> 즉,(FIFO) First In First Out이 특징이다.

### Array

> Search(검색) 작업시 시간복잡도가 Big-O(1)이라는 장점이 특징

**1. Search(검색)**

찾고자하는 요소의 인덱스 값을 알고 있으면 Big-O(1)의 시간복잡도로 접근이 가능하다. 따라서 random access의 장점을 가지고 있다

**2. Add, Remove(추가, 삭제)**
 
Big-O(1) search 작업이 끝난 뒤에 추가 작업이 필요하다. 즉, 시간이 더 걸린다. 추가, 삭제가 일어나면 해당 요소의 인덱스 보다 큰 인덱스 값을 가진 요소들을 Shift 해줘야하기 때문에 여기서 시간복잡도가 Big-O(n)이 된다.


### LinkedList

> 위 Array(배열)의 추가,삭제 작업시의 시간복잡도 문제를 해결해주는 자료구조이기는 하지만, 검색 작업시 시간복잡도가 Big-O(n)인 시간이 추가적으로 발생한다

**1. Search(검색)**

search 작업시 자료구조의 논리적 저장 순서와 물리적 저장 순서가 같지 않기 때문에, 해당 원소를 찾기 위해 Big-O(n)의 시간복잡도의 시간이 추가적으로 발생한다

**2. Add, Remove(추가, 삭제)**

각각의 원소들이 자기 자신의 이전/다음 요소들을 기억하고 있기 때문에, 추가, 삭제 작업이 시간복잡도가 Big-O(1)로 해결 가능하다. (Array가 가진 단점을 해결) 

### Hash Table

> Dictionary Struture의 기본 구조라고 할 수 있다
> Hash Table에 값을 넣으면, 특정 키 값에 매핑하게 되는데 Hash function에 의해서 이 키 값을 배열의 index로 계산해준다

## Algorithm

### Sorting Algorithm
---

#### Bubble Sort

시간복잡도: O(n^2)
> 모든 요소를 다 검색하고 비교해서 바꿔주는 것이며, 정렬된 (sorted) collection인 경우만 효율적인 방식이다 

#### Selection Sort

시간복잡도: O(n^2)
> 가장 작은 값을 먼저 찾아서 가장 앞에 있는 값과 바꿔주는 방식이다. 결론적으로 마지막 숫자가 가장 큰 것이 남게된다

#### Insertion Sort

시간복잡도: O(n^2)
> 좌측에서부터 우측으로 비교해서 좌측보다 우측이 작으면 우측을 좌측으로 바꿔주는 방식이다.

#### Merge Sort

시간복잡도: O(nlogn)
> Divide & Conquer => "split first" & "merge after"

** 모든 요소들을 split한 상태에서 merge를 시킬 때 정렬(sort)한다 (작은것이 앞쪽으로 큰것이 뒤쪽으로)

### Tree
---

#### Binary Tree & Binary Search Tree

***Binary Tree란?***

> 각 노드가 0,1,2 개의 자식 노드를 가진다. 최대 2개의 자식 노드까지만 가질 수 있으며, 이것이 binary 라고 표현하는 이유다.

<p align="center"><img width="400" height="240" src="/Img/binaryTree.png"></p>

***Binary Search Tree?***

- 항상 정렬(sorted)된 상태다
- 좌측 자식 노드 값은 부모 노드 값 보다 작고
- 우측 자식 노드 값은 부모 노드 값 보다 크다

<p align="center"><img width="400" height="240" src="/Img/binarySearchTree.png"></p>

#### Heap & Heap Sort

***Heap 이란?***

 - 완전 이진 트리의 일종으로 우선순위 큐를 위하여 만들어진 자료구조
 - 여러 값들 중에서 최소값과 최대값을 빠르게 찾아낼 수 있도록 만들어진 자료구조 
 - 힙 트리에서는 중복된 값을 허용

1. Max heap: 부모 노드 key 값 > 자식 노드 key 값
	- root node is highest value

2. Min heap: 부모 노드 key 값 < 자식 노드 key 값
	- root node is lowest value

#### Priority Queue

> 우선순위에 따라서 요소를 큐에서 dequeue하는 queue의 다른 버전

 - 우선순위 큐는 주어진 목록에서 최소값 혹은 최대값을 식별할 때 유용하다
 - priority order로 되어 있는 자료구조에서 값을 찾을 때 유용하다
 - enqueue & dequeue의 시간복잡도는 Big-O(logn)

### Graphs
---

#### Adjacency List
#### Dijkstra's Algorithm
#### Prim's Algorithm

### KMP
---

### LRU
---

