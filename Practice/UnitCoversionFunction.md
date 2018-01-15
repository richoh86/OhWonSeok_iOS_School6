# 단위 변경 함수 & 함수 연습 과제

~~~
//
//  UnitConversionFunction.swift
//  FuncPracitce
//
//  Created by richard oh on 2018. 1. 15..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation

class UnitConversionFunction {
    
    // inch to cm
    func inchTocm (inch: Double, cm: Double) -> Double {
        
        let changeNum: Double = 0.39370
        let cmResult: Double = inch / changeNum
        
        return cmResult
        
    }
    //cm to inch
    func cmToInch (inch: Double, cm: Double) -> Double {
        
        let changeNum: Double = 0.39370
        let inchResult: Double = cm * changeNum
        
        return inchResult
        
    }
    // m2 to 평
    func m2ToPyeong (m2: Double) -> Double {
        
        let changeNum: Double = 0.3025
        let pyeongResult:Double = m2 * changeNum
        
        return pyeongResult
        
    }
    // 평 to m2
    func pyeongToM2 (pyeong: Double) -> Double {
        
        let changeNum: Double = 3.30579
        let m2Result: Double = pyeong * changeNum
        
        return m2Result
        
    }
    
    //화씨 to 섭씨
    func fahToCel(fah: Double) -> Double {
        
        let celResult: Double = (fah - 32)/1.8
        
        return celResult
    }
    
    //섭씨 to 화씨
    func  celToFah(Cel: Double) -> Double {
        let fahResult: Double = (Cel * 1.8)+32
        
        return fahResult
    }
    
    //데이터량 KB to MG
    func kbToMg (kb: Double) -> Double{
        let changeNum: Double = 1024
        let mgResult: Double = kb * changeNum
        
        return mgResult
    }
    //MG to GB
    func mgToGb (mg: Double) -> Double {

        let changeNum: Double = 1024
        let GbResult: Double = mg/changeNum
        
        return GbResult
    }
    
    
    // 시간단위 -> 초단위 변경
    // hh mm ss
    // 101130
    func hhmmssToSs(from time: Int) -> Int {
        
        var remainTime: Int = time
        
        let second: Int = remainTime % 100 // 30
        
        remainTime = remainTime / 100 // 101130/100 = 1011
        let min: Int = remainTime % 100 // 11
        
        remainTime = remainTime / 100 // 1011/100 = 10
        let hour: Int = remainTime % 100 // 10
        
        return (hour * 3600) + (min * 60) + second
        
    }
    
    //<기초>
    //1-a 이름(문자열)을 받아서 이름을 출력하는 함수
    
    func prtName(name: String) {
        print(name)
    }
    
    //1-b 나이*(정수)를 받아서 나이를 출력하는 함수
    
    func prtAge(age: Int) {
        print(age)
    }
    
    //1-c.이름과 주소를 입력받아 자기소개글을 프린트 하는 함수(자기소개글은 자유)
    
    func prtIntro(name: String, add: String) {
        print("안녕하세요 제 이름은 \(name)이고, 주소는 \(add) 입니다")
    }
    
    //정수를 하나 입력받아서 2로 나눈 값을 반환해주는 함수
    
    func divideByTwo(num: Int) -> Int {
        
        return num / 2
    }
    
    //정수를 하나 입력받아서 제곱을 반환해주는 함수
    
    func square (num: Int) -> Int {
        
        return num * num
        
    }
    
    //<응용 - 다중 입력, 반환>
    
    //2-a. 두개의 정수를 입력받아 두수의 합을 반환해주는 함수
    
    func plus (num1: Int, num2: Int) -> Int {
        
        return num1 + num2
    }
    
    //2-b. 두개의 정수를 입력받아 두수의 차를 반환해주는 함수
    
    func minus (num1: Int, num2: Int) -> Int {
        
        return num1 - num2
        
    }
    
    //2-c. 두개의 정수를 입력받아 두수의 곱을 반환해주는 함수
    
    func multipy (num1: Int, num2: Int) -> Int {
        
        return num1 * num2
        
    }
    
    //2-d. 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수
    
    func divide (num1: Int, num2: Int) -> Int {
        
        return num1 / num2
        
    }
    
    
    //<응용>
    
    //부모님과 내 나이를 입력 후 그 나이차를 프린드 하는 함수 (ex: "어머니의 나이는 40세이고 내 나이는 20살이므로 우리의 나이차이는 20살 입니다.)
    
    func ageDiffNum(pAge: Int, myAge: Int) {
        
        print("어머니의 나이는 \(pAge)세이고 내 나이는 \(myAge)살이므로 우리의 나이차이는 \(pAge - myAge)살 입니다")
    
    }
    
    //시험점수 여러개를 입력받아서(4개이상) 평균을 반환해주는 함수
    
    func average(math: Int, eng: Int, sci: Int, music: Int) -> Double {
        
        return Double(math+eng+sci+music)/4
        
    }
    
    //<캐스팅>
    //정수를 하나 입력받아서 실수로 변환 후 반환해주는 함수
    
    func intToDouble (iNum: Int) -> Double{
        
        let dNum: Double = Double(iNum)
        return dNum
    
    }
    
    //정수를 두개를 입력받아 두수를 합친수를 출력하는 함수 (ex: 3,4 입력시 >>> 34 /// 1,0 입력시 >>> 10)
    
    func plus(num1: Int, num2: Int) {
        
        let combResult: String = String("\(num1)\(num2)")
        print(combResult)
        
    }
    
    //실수를 하나 입력받아서 소수점 첫번재 자리에서 반올림 후 정수를 반환해주는 함수
    
    func rounds(num: Double) -> Int{
        let resultNum: Int = Int(num)
        return resultNum
        
    }
    
    
}
~~~