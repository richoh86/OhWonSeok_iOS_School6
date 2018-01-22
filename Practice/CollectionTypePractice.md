# Collection Type 연습 문제 풀이

## Level 1
### 1. 시작과 끝수를 받아서 두 수 사이의 모든 수를 가지고 있는 배열 만들기
~~~
func startEndNum(sNum:Int, eNum:Int){

    var someints:[Int] = [Int]()

    for num in sNum+1..<eNum{
        someints.append(num)
    }
    print(someints)
}

// while 문으로 바꾸면..
//    var valueNum: Int = sNum
//    while valueNum < eNum {
//
//        someints.append(valueNum)
//        valueNum += 1
//    }

//startEndNum(sNum: 1, eNum: 10)
~~~


### 2. 정수 타입의 배열을 입력받아 모든 배열의 수의 합을 리턴하는 함수
~~~
let arrayInput:[Int] = [1,2,3,4,5,6,7,8,9]

func array1(arrayInput: [Int]) -> Int{

    var result: Int = 0
    for a in arrayInput{

        result += a
    }

    return result
}
//print(array1(arrayInput: arrayInput))
~~~

### 3. 딕셔너리에 있는 모든 데이터 출력하는 함수 >> 데이터: ["name":"joo", "age":20, "job":"Developer"]
~~~
var dic:[String:Any] = ["name":"joo", "age":20, "job":"Developer"]

func dDataPrint(inputD: [String:Any]){
    
    for (key,value) in dic{
        print(key, value)
    }
    
}

//print(dDataPrint(inputD: dic))
~~~


## Level 2
### 1. 정수 타입의 배열을 받아서 배열안의 중복된 수를 모두 제거된 배열을 반환하는 함수
~~~
let arrayD:[Int] = [1,2,3,4,4,5,5,6,6,7,8,8,9]

func removeDup(inputArray: [Int]) -> [Int]{
    
    var resultA:Array<Int> = Array<Int>()
    var count:Int = 0
    
    for a in inputArray {
        
        count = 0
        for b in inputArray{
            if a == b {
                count += 1
            }
        }
        
        if count == 1 {
            resultA.append(a)
        }
    }
    return resultA
}

//    contains 활용.
//    for a in inputArray {
//
//        if !resultA.contains(a){
//            resultA.append(a)
//        }
//
//    }
//    return resultA

//print(removeDup(inputArray: arrayD))
~~~

### 2. 정수 배열을 입력받아, 배열의 요소 중 두 개를 선택하는 조합을 모두 포함하는 배열을 작성하세요.
~~~
//정수 배열을 입력받아, 배열의 요소 중 두 개를 선택하는 조합을 모두 포함하는 배열을 작성하세요.
//>> [1, 2, 3] -> [[1, 2], [1, 3], [2, 3]]

let arrayC:[Int] = [1,2,3]

func combination(arrayInput:[Int]) -> [[Int]]{
    
    var result: [[Int]] = [[Int]]()
    
    var result1:[Int] = [Int]()
    var result2:[Int] = [Int]()
    var result3:[Int] = [Int]()
    
    for a in arrayInput {
        for b in arrayInput {
            
            if a != b {
                
                if result1.isEmpty == true{
                    result1 = [a,b]
                    
                }else if result2.isEmpty == true{
                    result2 = [a,b]
                    
                }else if result3.isEmpty == true {
                    result3 = [a,b]
                    if result3.sorted() == result1 || result3.sorted() == result2 {
                        result3.removeAll()
                    }
                }
            }
            
        }
    }
    result = [result1, result2, result3]
    
//    어떤 배열을 입력하더라도 원하는 값을 반환 할 수 있는 로직.
//    for n in 0..<arrayInput.count
//    {
//        var firstV = arrayInput[n]
//        for i in n+1..<arrayInput.count
//        {
//            let seconV = arrayInput[i]
//            [firstV,seconV]
//            result.append([firstV,seconV])
//        }
//    }
    return result
}

//print(combination(arrayInput: arrayC))
~~~
## Level 3
### 1. 정수 타입의 배열을 입력받아서 오름차순으로 정렬된 배열을 만들어 리턴하시오.(정렬 함수 사용x)(정렬의 효율은 보지 않습니다.)
~~~
// 제일 작은 수를 구한다

var arrayS:[Int] = [6,3,5,2,4]

func sortA (arrayInput:[Int]) -> [Int]{
    
    var array:[Int] = arrayInput
    for v in 0..<array.count{
        
        for v1 in v..<array.count{
            
            if array[v] > array[v1]{
                let temp: Int = array[v]
                print(temp)
                array[v] = array[v1]
                array[v1] = temp

            }
        }
    }
    
    return array
}

print(sortA(arrayInput: arrayS))
~~~

### 2. 에라토스테체 알고리즘을 이용하여  입력된 숫자까지의 모든 소수의 배열을 반환하는 함수
~~~
func eratosthenes(num:Int) -> [Int]{
    var arrayResult:[Int] = [Int]()
    
    // 입력된 값이 2보다 작거나 같을 때 배열에 입력된 숫자까지 그대로 담는다.
        if num <= 2 {
        for a in 1...num {
            arrayResult.append(a)
        }
        return arrayResult
    
    // 입력된 값이 2보다 클 때
    }else if num > 2{
        
        // 배열에 입력된 숫자까지 1부터 담는다
        for a in 1...num {
            arrayResult.append(a)
            }
        
        // 1,2,3,5,7을 제외하고 2,3,5,7의 배수는 배열에서 삭제한다 
        for b in arrayResult{
            
            switch b {
            case 1,2,3,5,7:
                break
            case let x where x % 2 == 0:
            arrayResult.remove(at:arrayResult.index(of: x)!)
            case let x where x % 3 == 0:
            arrayResult.remove(at:arrayResult.index(of: x)!)
            case let x where x % 5 == 0:
            arrayResult.remove(at:arrayResult.index(of: x)!)
            case let x where x % 7 == 0:
            arrayResult.remove(at:arrayResult.index(of: x)!)
            default:
                break
            }
            
        }
        
    }
    return arrayResult
}

print(eratosthenes(num: 20))
~~~