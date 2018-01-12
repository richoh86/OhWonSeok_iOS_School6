
# Calculator   

기본적인 계산기 기능과 UI를 구현하였습니다

## 소스 코드: ViewController.swift

~~~
//  CalculatorPractice
//
//  Created by richard oh on 2018. 1. 12..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNumDisplay: UILabel!// 첫번째 디스플레이
    @IBOutlet weak var secondNumDisplay: UILabel!// 두번째 디스플레이
    @IBOutlet weak var resultDisplay: UILabel!// 결과값 디스플레이
    
    var operationTemp: String = ""
    
    var firstNum: String = "0"
    var secondNum: String = "0"
    var resultNum: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Action Method
    
    @IBAction func clickedNumber(_ sender: UIButton) {
        
        
        // '!' 는 강제해제..(옵셔널을 신경쓰지 않기 위해서)
        let numberStr = sender.titleLabel!.text!// 화면에서 입력된 숫자를 상수 numberStr에 담는다
        
        print(operationTemp.count)
        // 연산자 유무확인
        if operationTemp.count > 0{ // 연산자 변수의 자리수를 카운트 (자리수가 > 0 일 때)
            
            if secondNum == "0" {
                
            secondNum = numberStr
                
            }else{// 0이 아닐 경우 숫자를 앞에 붙인다
            
            secondNum = secondNum + numberStr
            
                }
            
            secondNumDisplay.text = secondNum
            
        }else{// 연산자 버튼을 누른 횟수가 0인 경우
            
            if firstNum == "0"{
                firstNum = numberStr
                resetDisplay()
            }else{
                firstNum = firstNum + numberStr
            }
            
            firstNumDisplay.text = firstNum
            
        }
        
    }
    
    @IBAction func clickDidOperation(_ sender: UIButton) {
        
        let operStr = sender.titleLabel!.text!
        print(operStr)
        
        if firstNum != "0"{
            
            operationTemp = operStr
            changeColorBy(operation: operStr)
        }
        
    }
    
    @IBAction func clickDidCancel(_ sender: UIButton) {
        
        print("didCancel")

        resetDisplay()
        resetData()
        
    }
    
    @IBAction func clickDidResult(_ sender: UIButton) {
        
        print("didResult")
        
        if secondNum != "0"{
            
            let firstNumTemp: Int = Int(firstNum)!
            let secondNumTemp: Int = Int(secondNum)!
            let op: String = operationTemp
            
            let resultNum = calculation(firstNum: firstNumTemp, operation: op, secondNum: secondNumTemp)
            
            resultDisplay.text = String(resultNum)
            resetData()
            
        }
        
    }
    
    // MARK: - Private Method
    
    /// 연산 함수
    /// 두수를 연산자에 따라 연산하고 결과값을 리턴한다
    ///
    /// - Parameters:
    ///   - firstNum: 첫번째 디스플레이에 표시된 숫자
    ///   - operation: 연산을 위한 연산자
    ///   - secondNum: 두번째 디스플레이에 표시된 숫자
    /// - Returns: 연산의 결과값
    private func calculation(firstNum: Int,operation: String, secondNum: Int) -> Int {
        
        var resultNum: Int = 0
        
        switch operation {
        case "➕":
            print("더하기연산")
            resultNum = firstNum + secondNum
        case "➖":
            print("빼기연산")
            resultNum = firstNum - secondNum
        case "✖️":
            print("곱하기연산")
            resultNum = firstNum * secondNum
        case "➗":
            print("나누기연산")
            resultNum = firstNum / secondNum
        default:
            print("여기 걸리면 에러!")
        }
        return resultNum
    }
    
    //데이터 리셋
    private func resetData() {
        firstNum = "0"
        secondNum = "0"
        resultNum = "0"
        operationTemp = ""
    }
    
    //UI 리셋
    private func resetDisplay(){
        
        firstNumDisplay.text = "0"
        secondNumDisplay.text = "0"
        resultDisplay.text = "0"
        
        changeLabelBG(color: .white)
        
    }
    // 연산자 버튼에 따라서 디스플레이 배경색을 바꾸는 메소드
    private func changeColorBy(operation: String){
        
        var color:UIColor
        
        switch operation {
        case "➕":
            color = .orange
        case "➖":
            color = .yellow
        case "✖️":
            color = .green
        case "➗":
            color = .blue
        default:
            color = .white
            print("여기 걸리면 에러!")
        }
        
        changeLabelBG(color:color)
        
    }
    
    //색깔을 입력하면 디스플레이 배경색을 바꿔주는 메소드
    private func changeLabelBG(color: UIColor)
    {
        firstNumDisplay.backgroundColor = color
        secondNumDisplay.backgroundColor = color
        resultDisplay.backgroundColor = color
    }
    
    
}
~~~

## 코드 실행 이미지

![Caculator](/Img/Caculator.png)


