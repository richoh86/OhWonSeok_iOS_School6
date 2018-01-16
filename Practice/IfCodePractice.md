# IfCodePractice.swift

~~~
//
//  IfCodePracitice.swift
//  IfCodePractice
//
//  Created by richard oh on 2018. 1. 16..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation

class IfCodePractice {
    
    /// 점수를 등급으로 변환해주는 함수
    ///
    /// - Parameter score: 시험 점수
    /// - Returns: 시험 등급
    func grade (of score: Int) -> String{
        
        var grade: String = "F"
        
        if score <= 100 {
            
            if (score <= 100  && score >= 95 ) {
                grade = "A+"
                
            }else if (score >= 90 ) {
                grade = "A"
                
            }else if (score >= 85 ) {
                grade = "B+"
                
            }else if (score >= 80 ) {
                grade = "B"
                
            }
        }
        return grade
    }
    
    /// 등급을 포인트로 변환해주는 함수
    ///
    /// - Parameter grade: 시험 등급
    /// - Returns: 포인트
    func point (of grade: String) -> Double {
        
        var point: Double = 0.0
        
        if grade == "A+" {
            point = 4.5
        
        }else if grade == "A" {
            point = 4.0
            
        }else if grade == "B+"{
            point = 3.5
        
        }else if grade == "B"{
            point = 3.0
        }
        
        return point
    }
    
    
//    let myGrade: String = grade(of: 97)
//    let myPoint: Int = point(of: myGrade)
//
//    let myPoint: Int = point(of:grade(of: 97))

    //<if>
    //정수를 하나 입력받아 그 수가 짝수이면 true를  반환하는 함수
    func even(num: Int) -> Bool {
        
        var resultB: Bool = false
        
        if num % 2 == 0{
            
            resultB = true
        }
        return resultB
    }
    
    //문자열 두개를 입력받아 두 문자열이 같으면 true를 반환해주는 함수
    func compareString(str1: String, str2: String) -> Bool {
        var resultB: Bool = false
        
        if str1 == str2 {
            
            resultB = true
            
        }
        
        return resultB
    }
    
    //두 수를 입력받아 큰 수를 반환하는 함수를 작성하세요.
    // 같을 때 처리 다시 시도해볼 것
    
    func lNum(num1: Int, num2: Int) -> Int{
        
        var lNum: Int = 0
        
//        if num1 != num2 {
        
            if num1 > num2 {
                
                lNum = num1
                
            }else{
                
                lNum = num2
            }
//        } else {
//
//            return 0
//        }
        
        return lNum
    }
    
    //정수를 하나 입력받아 3의 배수이면 true를 반환해주는 함수
    
    func thrTimes(num1: Int) -> Bool {
        
        var resultB: Bool = false
        
        if num1 != 0 {
            if num1 % 3 == 0 {
                
                resultB = true
            }
        }
        return resultB
    }
    
    // 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수 (첫번째 값을 두번째 값으로 나눈다. 0으로 나누기를 할시 0을 반환)
    
    func divide(num1: Int, num2: Int) -> Double {
        
        var resultNum: Double  = 0
        
        if (num1 / num2) != 0{
            
            resultNum = Double(num1 / num2)
        
        }else if num2 == 0{
            
            resultNum = 0
        }
        return resultNum
    }
    
    //응용
    //시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")
    
    func grade(score: Int) -> String {
        
        var grade: String = "F"
        
        if score > 95 {
            
            grade = "A+"
        
        }else if score > 80 {
            
            grade = "B"
        }
        
        return grade
    }
    
    //여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수
    
    func average (grade1: String, grade2: String, grade3: String) -> Double{
        
        var average: Double = 0.0
        
        // 위 point 함수 사용
        let point1: Double = point (of: grade1)
        let point2: Double = point (of: grade2)
        let point3: Double = point (of: grade3)
        
        average = (point1+point2+point3)/3
        
        return average
        
    }
    
    //윤년 구하기 문제(년도를 받아서 윤년인지 아닌지 판단하는 함수)
    func leapYear (year: Int) -> String {

        var result: String = ""
        
        if year % 4 == 0 || ((year % 100 == 0) && ((year/100) % 400 == 0)) {
            
            result = "윤년"
        
        }else{
            
            result = "평년"
        }
        
        return result
    }
    
    //세 수를 입력받아 그 곱이 양수이면 true, 0 혹은 음수이면 false, 둘 다 아니면 에러를 발생시키는 함수를 작성하세요.(에러 제외)
    func pnBool (num1: Double,num2: Double,num3: Double) -> Bool {
        
        var resultB: Bool = false
        let num: Double = num1 * num2 * num3
        
        if num > 0 {
            
            resultB = true
        }
//         else if num == 0 || num < 0 {
//
//            resultB = false
//        }
//        위 코드는 사실상 필요 없음 default 값이 false 이기 때문에
//        if 조건에 해당하지 않는다면 모두 false 값으로 리턴.
        
        return resultB
    }

    
}

~~~