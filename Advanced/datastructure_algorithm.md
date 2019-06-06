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

## Algorithm

### Sorting Algorithm
---
#### Bubble Sort
#### Selection Sort
#### Insertion Sort

#### Merg Sort

### Tree
---

#### Tree & Binary Tree
#### Heap & Heap Sort
#### Priority Queue

### Graphs
---

#### Adjacency List
#### Dijkstra's Algorithm
#### Prim's Algorithm

### KMP
---

### LRU
---

