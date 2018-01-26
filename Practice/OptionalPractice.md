# Optional Practice

## Forced Unwrapping

> '!' 를 활용하여 optional(옵셔널) 인수 name을 forced(강제적으로) unwarpping(해제)하는 코드를 구현하였습니다   

~~~
// 평균 점수별 등급 부여하기
    public func calGradeOf(name: Student?) -> String {
    
  // 강제적 옵셔널 해제
        var grade:String = ""
        var average:Double = 0

        if name != nil {
        average = averageOf(name: name!) ==> !를 사용한다

        switch average {
        case 95..<100:
            grade = "A"
        case 85..<95:
            grade = "B"
        case 75..<85:
            grade = "C"
        case 65..<75:
            grade = "D"
        default:
            grade = "F"
        }

        return grade
    }
~~~

## Optional Binding

>  Binding을 통해서 Optional(옵셔널) name을 unwrapping(해제)하여 unwrappedName 상수에 담는 코드를 구현하였습니다

~~~
  // 한 학생의 과목 전체 평균 점수 구하기!
    func averageOf(name:Student?) -> Double {
        var average:Double = 0
        
        // 선택적 바인딩 옵셔널 해제
        if let unwrappedName:Student = name {
        
            average = Double(unwrappedName.getTotalScore()/unwrappedName.subjects.count)
        
        }
        
        return average
    }
~~~

## Early Exit

> guard 문을 활용하여 optional값 name이 nil이 아닌 경우만 이후 코드를 실행하도록 구현하였습니다 

~~~
// 평균 점수별 등급 부여하기
    public func calGradeOf(name: Student?) -> String {
        
        // Earyl Exit-Guard문 활용
        guard let unwrappedName:Student = name else {
            return "nil값이 들어왔습니다"
        }
        
        var grade:String = ""
        var average:Double = 0
        
        average = averageOf(name: unwrappedName)
        
        switch average {
        case 95..<100:
            grade = "A"
        case 85..<95:
            grade = "B"
        case 75..<85:
            grade = "C"
        case 65..<75:
            grade = "D"
        default:
            grade = "F"
        }
        
        return grade
        
        }
~~~