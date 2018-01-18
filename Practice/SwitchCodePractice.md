# SwitchCodePractice.swift

~~~
//
//  SwitchCodePractice.swift
//  IfCodePractice
//
//  Created by richard oh on 2018. 1. 16..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation

class SwitchCodePractice {
//
//    if (score <= 100  && score >= 95 ) {
//    grade = "A+"
//
//    }else if (score >= 90 ) {
//    grade = "A"
//
//    }else if (score >= 85 ) {
//    grade = "B+"
//
//    }else if (score >= 80 ) {
//    grade = "B"
//
//    }
    
    /// case문으로 만든 (등급) grade 계산 함수
    /// ==> interval Matching ex) 95...100
    ///
    /// - Parameter score: 시험 점수
    /// - Returns: 시험 등급
    func grade(of score: Int) -> String {
        
        var grade: String = ""
        
        if score <= 100 {
            
            switch score {
            case 95...100:
                grade = "A+"
            case 90...95:
                grade = "A"
            case 85...90:
                grade = "A"
            case 80...85:
                grade = "A"
            default:
                grade = "F"
            }
            
        }
        return grade
    }
    
    /// case 문으로 만든 (포인트) point 계산 함수
    ///
    /// - Parameter grade: 시험 등급
    /// - Returns: 포인트
    func point(of grade: String) -> Double {
        
        var resultP: Double = 0.0
        // 0 으로 넣어도 상관 없다 선언된 변수 타입에 맞춰감
        
        switch grade {
        case "A+":
            resultP = 4.5
        case "A":
            resultP = 4.0
        case "B+":
            resultP = 3.5
        case "B":
            resultP = 3.0
        default:
            resultP = 0.0
        }
    
        return resultP
    }
    
//    print 함수 테스트 시 (playground에서..)
//    print("A+의 포인트는", (point(of: "A+")))
//    print(point(of: "A"))
//    print(point(of: "B+"))
//    print(point(of: "B"))
    
    // 튜플 예제
    func getPoint(somePoint:(Int,Int)) {
        
        switch somePoint {
        case (0,0):
            print("\(somePoint)")
        case (_,0):
            print("\(somePoint)")
        case (0,_):
            print("\(somePoint)")
        case (0,0):
            print("\(somePoint)")
        default:
            print("default")
        }
    }
    
    /// (정사각형/직사각형/원)면적 계산 함수 *switch문 활용
    ///
    /// - Parameters:
    ///   - width: 너비
    ///   - height: 높이
    ///   - radius: 반지름
    /// - Returns: 넓이 값 (면적)
    func area1 (width: Double, height: Double, radius: Double) -> Double {
        
        let compareData = (width, height, radius)
        let pi: Double = 3.14
        var area: Double = 0.0
        
        switch compareData {
        
        case (width, 0, 0): // 정사각형
             area = width * width
        case (width, height, 0): // 직사각형
            area = width * height
        case (0, 0, radius): // 원
            area = pi * (radius * radius)
        default:
            area = 0
        }
        
        return area
        
    }
    
    /// 삼각형/사다리꼴 면적 계산 함수 *switch문 활용
    ///
    /// - Parameters:
    ///   - a: 사다리꼴 밑변 길이
    ///   - b: 삼각형 밑변 길이 또는 사다리꼴 윗변 길이
    ///   - h: 높이
    /// - Returns: 넓이 값(면적)
    func area2 (a: Double = 0, b: Double, h: Double) -> Double {
        let compareData = (a, b, h)
        var area: Double = 0.0
        
        switch compareData {
        case (0, b, h): // 삼각형
            area = (1/2) * b * h
        case (let y,b,h): // 사다리꼴
            area = (1/2) * h * (y+b)
        default:
            area = 0
        }
        return area
    }
    
    //위 함수 test시 a 값을 넣어주면 첫번째 구문에서 a 값을 매개변수로 받을 필요가 없다
    //print(area2(b: 3, h: 4))
    //print(area2(a:3, b: 4, h: 5))
    //let y는 해당 케이스문 안에서만 값을 활용하기 위해서다
    
    ///  (정육면체/직육면체/원기둥/구/원뿔) 부피 계산 함수
    ///
    /// - Parameters:
    ///   - width: 폭, 너비
    ///   - length: 길이
    ///   - height: 높이
    ///   - radius: 반지름
    ///   - coneV: 원뿔 부피 공식 기본값 = 1/3
    /// - Returns: 도형의 부피 값
    func volume (width: Double, length: Double, height: Double, radius: Double, coneV: Double = (1/3)) -> Double {
        
        let compareData = (width, length, height, radius, coneV)
        let pi: Double = 3.14
        var volume: Double = 0.0
        
        switch compareData {
        case (width,0,0,0,0): // 정육면체
            volume = width * width * width
        
        case (width,length,height,0,0): // 직육면체
            volume = width * length * height
        
        case (0,0,height,radius,0): // 원기둥
            volume = pi * (radius * radius) * height
        
        case (0,0,0,radius,0): // 구
            volume = (4/3) * pi * (radius * radius * radius)
        
        case (0,0,height,radius,coneV): // 원뿔
            volume = coneV * pi * (radius * radius) * height
        
        default:
            volume = 0
        }
        return volume
    }
    
    
    // where 구문 예제 연습
    /// case+where 구문 연습 함수
    ///
    /// - Parameter score: 시험 점수
    /// - Returns: 시험 등급
    func gradeWhereCode(score: Int) -> String {
        
        var grade: String = "F"
        
        
        switch score {
        
        case let x where x >= 95 && x <= 100:
            grade = "A+"
        
        case let x where x >= 90 && x < 95:
            grade = "A"
        
        case let x where x >= 85 && x < 90:
            grade = "B+"
        
        case let x where x >= 80 && x < 85:
            grade = "B"
        
        default:
            grade = "F"
        }
        
        return grade
    }
    
    // switch-case
    // 월을 입력받아 해당월의 이름을 반환해주는 함수 (ex: 1 >>> "Jan", 12 >>> "Dec", 13 >>> "Error"
    
    /// 월 숫자 -> 월 이름 변환 함수
    ///
    /// - Parameter monNum: 월 숫자
    /// - Returns: 월 이름
    func monthName (monNum : Int) -> String {
        
        var monthName: String = ""
        
        switch monNum {
        case 1:
            monthName = "Jan"
        case 2:
            monthName = "Feb"
        case 3:
            monthName = "Mar"
        case 4:
            monthName = "Apr"
        case 5:
            monthName = "May"
        case 6:
            monthName = "Jun"
        case 7:
            monthName = "Jul"
        case 8:
            monthName = "Aug"
        case 9:
            monthName = "Sep"
        case 10:
            monthName = "Oct"
        case 11:
            monthName = "Nov"
        case 12:
            monthName = "Dec"
        default:
            monthName = "Error"
        }
        return monthName
    }
    
    //윤년 구하기 문제(년도를 받아서 윤년인지 아닌지 판단하는 함수)
    /// 윤년,평년 구분 함수
    ///
    /// - Parameter year: 연도
    /// - Returns: 윤년 or 평년
     func leapYear (year: Int) -> String {
        
        var result: String = ""
        
        if year % 4 == 0 && year % 100 != 0 {
            
            result = "윤년"
            
        }else if (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0) {
            
            result = "윤년"
        }else{
            
            result = "평년"
        }
        
        return result
    }
    
    // switch
     func leapYearS(year: Int) -> String {
        
        var result: String = ""
        
        switch year {
            
        case let x where x % 4 == 0 && year % 100 != 0:
            //        print(year)
            result = "윤년"
        case let x where x % 400 == 0:
            print(year)
            result = "윤년"
        default:
            result = "평년"
        }
        
        return result
    }
    
    ///년/월을 입력받아 해당 들의 마지막 날을 반환 해주는 함수(윤년 고려)
    ///
    /// - Parameters:
    ///   - month: 월 정수
    ///   - year: 연도 정수
    /// - Returns: 마지막 날
    func lastDay(of month: Int, year: Int) -> Int {
        
        let resultOfyear: String = leapYear(year: year)// 윤년인지 평년인지 먼저 구분한다
        print(resultOfyear)
        var lastDay: Int = 0
        
        if resultOfyear == "윤년"{ // 윤년일 경우
            switch month {
            case 1,3,5,7,8,10,12:
                lastDay = 31
            case 4,6,9,11:
                lastDay = 30
            case 2:
                lastDay = 29
            default:
                lastDay = 0
            }
        }else{// "평년" 일 경우
            switch month {
            case 1,3,5,7,8,10,12:
                lastDay = 31
            case 4,6,9,11:
                lastDay = 30
            case 2:
                lastDay = 28
            default:
                lastDay = 0
            }
        }
        return lastDay
        
    }
    //---------------위에서 완료-----------------//
    //if문->switch문 변환 !
    //시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")
    //도형 부피 구하기 함수
    //도형 넓이 구하기 함수
    //---------------위에서 완료-----------------//
    
}


~~~