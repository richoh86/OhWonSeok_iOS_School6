# 반복문 연습문제 풀이 정리

## While문

### 1. 입력된 숫자까지 1부터 모두 더해서 값을 반환하는 함수
~~~
/// 입력된 숫자까지 1부터 모두 더하는 함수
///
/// - Parameter num: 숫자 입력 값
/// - Returns: 1부터 입력한 숫자 값까지 더한 값
func triangle(num:Int) -> Int{

    var  tempNum: Int = num
    var resultNum = 0
    
    while tempNum > 0 {

        resultNum += tempNum
        tempNum -= 1
    }
    return resultNum
}

print(triangle(num: 3))
~~~

### 2. 숫자의 각 자리수들을 모두 더해서 값을 반환하는 함수
~~~
/// 숫자의 각 자리수들을 모두 더하는 함수
///
/// - Parameter num: 숫자 입력 값
/// - Returns: 각 자리수들의 합
func addAll(num: Int) -> Int{
    
    var tempNum: Int = num
    var sumNum: Int = 0
    while tempNum > 0 {
        let lastNum: Int = tempNum % 10
        sumNum += lastNum
        tempNum /= 10
    }
    return sumNum
    
}

print(addAll(num: 12345))
~~~

### 3. 숫자를 거꾸로 나열한 값을 반환하는 함수
~~~
/// 숫자를 거꾸로 나열하는 함수
///
/// - Parameter num: 입력 숫자 값
/// - Returns: 숫자가 거꾸로 나열된 값
func reverse(num: Int) -> String {

    var tempNum: Int  = num
    var resultNum: String = ""
    
    while tempNum > 0 {
        let lastNum: Int = tempNum % 10
        resultNum += String(lastNum)
        tempNum /= 10
    }
    return resultNum
}

print(reverse(num: 341))
~~~
### 4. 1이 되는 카운트 숫자 계산하여 값을 반환하는 함수
~~~
/// 1이 되는 카운트 숫자 계산하는 함수
///
/// - Parameter num: 숫자 입력 값
/// - Returns: 총 몇번만에 1이 되는지 카운트된 숫자
func collatz (num: Int) -> Int {
    
    var tempNum: Int = num
    var totalCount: Int = 0
    
    while tempNum != 1{
        
        if tempNum % 2 == 0 {
            
            tempNum /= 2
            
        }else if tempNum % 2 == 1{
            
            tempNum = (tempNum * 3)+1
        }
        totalCount+=1
        print(tempNum)
        if totalCount >= 500 {
            return -1
        }
    }
    return totalCount
}

//print(collatz(num: 10))
~~~
### 5. harshad 계산 함수
~~~
func harshad (num:Int) -> Bool {
    
    var result: Bool = false
    var tempNum : Int = num
    var totalNum: Int = 0
    
    
    while tempNum > 0 {
        totalNum += tempNum % 10
        tempNum /= 10
    }
    if num % totalNum == 0 {
        print(num,totalNum)
        result = true
    }
    print(num,totalNum)
    return result
}
print(harshad(num:181))
~~~
## for문

### 1. factorial 계산값을 반환하는 함수
~~~
/// factorial 계산 함수
///
/// - Parameter num: 숫자 입력 값
/// - Returns: 팩토리얼 최종 계산 값
func factorial (num: Int) -> Int {

    var temNum : Int = num
    var resultNum : Int = 1

    for _ in 1...num  {

        resultNum *= temNum
        temNum -= 1

    }

    return resultNum
}
~~~

### 2. 정수 두개를 입력받아서 첫번째 수를 두번째 수의 횟수 만큼 곱한 값을 반환해주는 함수 
### (ex: 2,3 >>> 8 /// 3,3 >>> 27)
~~~
func squareDigit (num1:Int, num2: Int) -> Int{
    
    var result: Int = 1
    
    for _ in 1...num2 {
        
        result *= num1
        
    }
    return result
}

print(squareDigit(num1: 3, num2: 4))
~~~

### 3. 정수 하나를 받아서 1부터 정수까지의 숫자중 짝수를 모두 출력해주는 함수
~~~
func evenAll (num: Int) {
    
    for x in 1...num{
        
        if x % 2 == 0 {
            print(x)
        }
        
    }
    
}

print(evenAll(num: 10))
~~~

### 4. 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

~~~
func commonMultiple (){
    
    for x in 1...100 {
        if x % 3 == 0 && x % 5 == 0{
         print(x)
        }
    }
    
}
print(commonMultiple())
~~~

### 5. 정수 하나를 받아서 그 정수의 약수를 출력하는 함수

~~~
func calDivisor (num: Int){
    
    let tempNum: Int = num
    
    for x in 1...num {
        
        if tempNum % x == 0{
            print(x)
        }
    }
    
}
print(calDivisor(num: 12))
~~~

### 6. 2 이상의 정수를 입력받아, 그 수가 소수인지 아닌지를 판별하는 함수

~~~
func decimal(num: Int) -> String {
    
    var result: String = ""
    
    if num >= 2 {
        
        if num == 2 {
            result = "소수"
            
        }else{
            
            for x in 2..<num {
               print(num, x)
                
                if num % x == 0 {
                    return "소수아님"
                }else{
                    
                }
                
            }
        return "소수"
        }
        
    }
    return result
    
}

print(decimal(num: 30))
~~~

