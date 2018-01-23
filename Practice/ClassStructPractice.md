# ClassSturctPractice

> class와 struct를 구성하고 ViewController에서 호출하는 연습  

## ViewController

> 각 클래스의 구조적 특성을 활용하여 의도하는 함수와 변수를 호출해서 값을 얻고 출력하는 중심이 되는 곳

> 즉, 실질적인 프로그램 실행 구문은 이 곳에서 시작된다

~~~
//
//  ViewController.swift
//  Practice20180123
//
//  Created by richard oh on 2018. 1. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cal:Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let limYowhan = Person(name: "임요환", gender: "남성", major: "테란")
        let dicI = ["테란":100, "저그":90, "프로토스": 85]
        limYowhan.setSubject(subjectDic: dicI)
        
        let hongJinHo = Person(name: "홍진호", gender: "남성", major: "저그")
        let dicH = ["테란":75, "저그":100, "프로토스": 80]
        hongJinHo.setSubject(subjectDic: dicH)
        
        let Kanmin = Person(name: "강민", gender: "남성", major: "프로토스")
        let dicIK = ["테란":70, "저그":95, "프로토스": 100]
        Kanmin.setSubject(subjectDic: dicIK)
        
        // 각 사람별 전체 종족 평균 점수
        cal.average(person: limYowhan)
        // 테란을 가장 잘하는 사람
        cal.terranZzang(person: limYowhan,hongJinHo,Kanmin)
        // 두명 중 누가 더 프로토스를 잘하는지 그리고 몇점 더 잘 하는지
        cal.protossZzang(pro1: limYowhan, pro2: Kanmin)
        
        // 저그를 가장 잘하는 프로게이머와 프로토스를 가장 잘하는 프로게이머를 출력
        cal.zpZzang(pro: limYowhan,hongJinHo,Kanmin)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
~~~

## Calculcator (class)

> 평균 값, 점수, 점수 비교 등의 계산 함수를 정의해둔 클래스

~~~
//
//  Calculator.swift
//  Practice20180123
//
//  Created by richard oh on 2018. 1. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation


class Calculator {
    
    
    /// 입력한 프로게이머의 전체 종족 평균 점수 구하기
    ///
    /// - Parameter person: 입력한 프로게이머
    /// - Returns: 전체 종족 평균 점수 값
    func average(person:Person) {
        
        var totalScore:Int = 0
        var averageScore:Double = 0
        for a in person.subject{
            
            totalScore += a.score
            
        }
        
        averageScore = Double(totalScore/person.subject.count)
        
       print("프로게이머 \(person.name)의 전체 종족 평균 점수는 \(averageScore)입니다")
    }
    
    /// 테란을 가장 잘하는 프로게이머와 점수를 구하는 함수
    ///
    /// - Parameter person: 입력한 프로게이머들
    func terranZzang(person:Person...){
    
        var highScore:Int = 0
        var compScore:Int = 0
        var terranZ:String = ""
        
        for t in person
        {
            compScore = t.terranZ()
        
            if highScore < compScore {
                
                highScore = compScore
                terranZ = t.name
            }
        
        }
        
        print("테란을 가장 잘하는 프로게이머는 \(terranZ)이고 점수는 \(highScore)점 입니다")
    }
    
    /// 두명 중 누가 더 프로토스를 잘하는지 그리고 몇점 더 잘 하는지
    ///
    /// - Parameters:
    ///   - pro1: 점수 비교 프로게이머1
    ///   - pro2: 점수 비교 프로게이머2
    func protossZzang(pro1:Person,pro2:Person){
        
        let p1 = pro1
        let p2 = pro2
        var proZ: String = ""
        var diff: Int = 0
        
        if p1.protossZ() > p2.protossZ() {
            
            proZ = p1.name
            diff = p1.protossZ() - p2.protossZ()
        
        }else if p2.protossZ() > p1.protossZ(){
            
            proZ = p2.name
            diff = p2.protossZ() - p1.protossZ()
        }
        
        print("프로토스를 잘하는 프로게이머는 \(proZ)이고, 점수는 \(diff)점이 더 높습니다")

    }
    
    // 저그를 가장 잘하는 프로게이머와 프로토스를 가장 잘하는 프로게이머를 출력
    func zpZzang(pro: Person...){
        
        var zZzang:String = ""
        var pZzang:String = ""
        var highScoreZ:Int = 0
        var highScoreP:Int = 0
        
        for a in pro {
            
            switch a.zergProtoss(){
              
            case let (x,y):
                
                var compScoreZ:Int = 0
                var compScoreP:Int = 0
                
                compScoreZ = x
                if highScoreZ < compScoreZ {
                    highScoreZ = compScoreZ
                    zZzang = a.name
                }
                
                compScoreP = y
                if highScoreP < compScoreP {
                    highScoreP = compScoreP
                    pZzang = a.name
                }
            default:
                break
            }
        }
        print("저그를 가장 잘하는 프로게이머는 \(zZzang)이고, 프로토스를 가장 잘하는 프로게이머는 \(pZzang)입니다")
    }
    
}
~~~
## 위 ViewController 실행시 시스템 출력 로그

![](/Img/starcraft.png "스타크래프트")

## Person (class)

> 각 프로게이머들의 이름,성별,전공 프로퍼티가 선언되어 있으며, Subject struct 타입의 배열 선언 및 Viewcontroller에서 호출되어야 하는 함수를 만든 클래스

~~~
//
//  Person.swift
//  Practice20180123
//
//  Created by richard oh on 2018. 1. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation


class Person{
    var name:String
    var gender:String
    var major:String
    
    var subject:[Subject] = []
    
    init(name:String,gender:String,major:String) {
        self.name = name
        self.gender = gender
        self.major = major
    }
    
    func addSubject(name:String,score:Int){
        
        subject.append(Subject(name:name,score:score))// Subject (struct) => memberwise intialized
        
    }
    
    func setSubject(subjectDic:[String:Int]){
        
        for (subName,subScore) in subjectDic{
            
            addSubject(name: subName, score: subScore)
            
        }
        
    }
    
    /// 프로게이머의 테란 점수를 구하는 함수
    ///
    /// - Returns: 테란 점수
    func terranZ() -> Int{
        var score:Int = 0
        
        for t in subject {
            
            if t.name == "테란"{
                score = t.score
            }
            
        }
        return score
    }
    
    /// 프로게이머의 프로토스 점수를 구하는 함수
    ///
    /// - Returns: 프로토스 점수
    func protossZ() -> Int{
        
        var score:Int = 0
        for p in subject {
            
            if p.name == "프로토스"{
                
               score = p.score
            }
            
        }
        return score
    }
    
    //저그와 프로토스 점수를 구하는 함수
    func zergProtoss() -> (Int,Int)
        
    {
        var zScore:Int = 0
        var pScore:Int = 0
        
        for zp in subject {
            
            if zp.name == "저그"{
            
                zScore = zp.score
            
            }else if zp.name == "프로토스"{
                
                pScore = zp.score
            }
            
        }
        return (zScore,pScore)
    }
    
}
~~~

## Subject (struct)

> 각 과목 이름과 점수를 선언할 수 있는 'Subject' struct 
 
~~~
//
//  Subject.swift
//  Practice20180123
//
//  Created by richard oh on 2018. 1. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation


struct Subject {
    var name:String
    var score:Int
}
~~~