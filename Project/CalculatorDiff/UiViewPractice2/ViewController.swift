//
//  ViewController.swift
//  UiViewPractice2
//
//  Created by richard oh on 2018. 1. 29..
//  Copyright © 2018년 richard oh. All rights reserved.
//
// [completed]
// 숫자 + 연산자 + 숫자 + = 실행 후 해당 결과값에 다시 연산 가능한 로직 -> 완료
// "+/-" 버튼 음수 <-> 양수 전환 기능 -> 완료
// "%" 만약 숫자 10의 백분율 값을 소수점으로 표현하면 0.1 로직: 입력된 숫자 * 1/100 -> 완료
//
// [not completed]
// 1. 숫자 + 연산자 + 숫자 + 연산자 ... 연속 로직
// 2. 소수점 표현 및 계산 로직
// 2-1. 소수점 0.001 만들기 (여기서 0.00.1 같은 형태가 나오지 않도록 구현 + 전체 텍스트 값에서 .이 한번이라도 포함되면 더 이상 입력 불가 로직) -> 완료
// 2-2. 계산로직 -> 완료
// 2-3. 0 결과 뷰에 입력된 상태에서 숫자를 누를 때 로직은 만약 inputStr이 . 이 들어온다면 뷰를 지우지 않고 그대로 붙여야 한다

import UIKit

class ViewController: UIViewController {
    
    // 첫번째 입력 숫자
    var firstNum: Double = 0
    // 두번째 입력 숫자
    var secondNum: Double = 0
    // 결과값 입력 숫자
    var resultNum: Double?
    // 연산자 입력 변수
    var oPerator: String = ""
    // 연산자 입력 후 결과 뷰 clear를 위한 용도
    var oPeratorCount: Int = 0
    // . 입력 후 중복 체크를 위한 변수
    var dotCount: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 뷰 생성 -> 버튼 생성(로직포함)
        executeAllFunc()
        
    }
    
    /// 계산기 실행 함수
    func executeAllFunc(){
        
        // 계산 결과 뷰 생성
        makeResultView()
        
        // AC, +/-, % 버튼을 위한 영역 뷰 및 버튼(로직포함) 생성
        makeExtraBtn()
        
        // / , * , -, + 버튼을 위한 영역 뷰 및 버튼(로직포함) 생성
        makeComputeBtn()
        
        // 숫자(1~9) 버튼을 위한 영역 뷰 및 버튼(로직포함) 생성
        makeNumberBtn()
        
        // 숫자 0, . 버튼을 위한 영역 뷰 및 버튼(로직포함) 생성
        zeroAndDotBtn()
        
    }
    
    /// 모든 변수 초기화 + 결과 뷰 텍스트 0으로 초기화
    func clear(){
        firstNum = 0
        secondNum = 0
        resultNum = 0
        oPerator = ""
        rV.text! = "0"
    }
    
    /// = 버튼을 눌렀을 때 모든 변수 값 초기화
    func clearWhenResultBtn(){
        firstNum = 0
        secondNum = 0
        resultNum = 0
        oPerator = ""
    }
    
    // 결과 값을 위한 UILable 인스턴스 생성
    let rV: UILabel = UILabel()
    ///0.  결과 값을 보여주는 View
    func makeResultView(){
        
        rV.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/3)
        rV.backgroundColor = UIColor.black
        rV.alpha = 0.8
        rV.text = "0"
        rV.textAlignment = NSTextAlignment.right
        rV.textColor = UIColor.white
        rV.font = rV.font.withSize(100.0)
        
        view.addSubview(rV)
    }
    
    /// 1-1. AC,+/-,% 버튼을 구현하는 영역의 SuperView 구현 함수
    ///
    /// - Returns: AC,+/-,%  버튼을 구현하기 위한 영역의 UIView
    func makeExtraView() -> UIView {
        
        let eV: UIView = UIView()
        
        let inputX: CGFloat = CGFloat(0)
        let inputY: CGFloat = CGFloat(view.frame.size.height/3)
        let inputW: CGFloat = CGFloat(view.frame.size.width*3/4)
        let inputH: CGFloat = CGFloat((view.frame.size.height*2/3)/5)
        
        eV.frame = CGRect(x: inputX, y: inputY, width: inputW, height: inputH)
        eV.backgroundColor = UIColor.black
        eV.alpha = 0.8
        view.addSubview(eV)
        
        return eV
    }
    
    /// 1-2. AC,+/-,% 버튼을 SuperView 영역에 subView로 추가하는 함수
    func makeExtraBtn() {
        
        let btnList: [String] = ["AC","+/-","%"]
        
        let superView = makeExtraView()
        
        for index in 0..<3 {
            
            let eB: UIButton = UIButton()
            
            let inputX: CGFloat = CGFloat(superView.frame.size.width*CGFloat(index)*(1/3))
            let inputY: CGFloat = CGFloat(0)
            let inputW: CGFloat = CGFloat((superView.frame.size.width-20)/3)
            let inputH: CGFloat = CGFloat(superView.frame.size.height - 5)
            
            eB.frame = CGRect(x: inputX, y: inputY, width: inputW, height: inputH)
            eB.backgroundColor = UIColor.darkGray
            eB.layer.cornerRadius = 0.5 * eB.bounds.size.width
            eB.layer.masksToBounds = true
            eB.setTitle(btnList[index], for: UIControlState.normal)
            eB.setTitleColor(.orange, for: UIControlState.highlighted)
            eB.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            eB.addTarget(self, action: #selector(btnExtra(_:)), for: UIControlEvents.touchDown)
            superView.addSubview(eB)
            
        }
    }
    
    /// AC,+/-,% 버튼 액션 함수
    ///
    /// - Parameter sender: AC,+/-,% UIButton 인스턴스 중 1개
    @objc func btnExtra(_ sender: UIButton){
        
        guard let extraBtn:String = sender.titleLabel?.text else {return}
        
        switch extraBtn{
        case "AC" :
            clear()
        case "+/-" :
            if rV.text! != "" {
                // 텍스트 -> 실수로 변환 후 확인
                // Double로 캐스팅
                let tempStr: Double = Double(rV.text!)!
                var result: String  = ""
                // 1. 실수로 변환된 tempStr를 1로 나눈 나머지 값이 0 보다 큰 경우
                // 2. 실수로 변환된 tempStr을 1로 나눴을 때 나머지 값이 음수가 나오는 경우 다시 -1 을 곱해서 양수로 만든 뒤 0보다 클 경우
                // 위 2가지 경우 중 1가지만 만족한다면 if 구문 조건을 만족한다
                if tempStr.truncatingRemainder(dividingBy: 1) > 0 || tempStr.truncatingRemainder(dividingBy: 1)*(-1) > 0 {
                    result = String(tempStr*(-1))
                }else{
                    result = String(Int(tempStr*(-1)))
                    
                }
                // 양수에서 음수로 변환 또는 음수에서 양수로 변환
                // 무조건 -1 을 곱해준다
                rV.text! = result
            }
        case "%" :
        if rV.text! != "" {
            var tempRvTxt: Double = 0
            tempRvTxt = Double(rV.text!)!
            // 입력된 숫자에 1/100을 곱해준다
            rV.text! = String(tempRvTxt * (1/100))
            }
        default:
        break
              }
    }
    
    /// 2-1. 연산자 버튼 영역 뷰 만드는 함수
    ///
    /// - Returns: 연산자 영역 뷰
    func makeComputeView() -> UIView{
        
        let inputH: CGFloat = CGFloat(view.frame.size.height*2/3)
        let inputW: CGFloat = CGFloat((view.frame.size.width)/4)
        let inputX: CGFloat = CGFloat(view.frame.size.width*3/4)
        let inputY: CGFloat = CGFloat(view.frame.size.height/3)
        
        let v: UIView = UIView()
        v.frame = CGRect(x: inputX , y:inputY ,width: inputW, height: inputH)
        v.backgroundColor = UIColor.black
        v.alpha = 0.8
        view.addSubview(v)
        
        return v
    }
    
    /// 2-2. 연산자 영역에 버튼 만들기 함수
    func makeComputeBtn(){
        
        let superView: UIView = makeComputeView()
        let bTnList: [String] = ["➗","✖️","➖","➕","="]
        
        for index in 0..<5{
            
            let b: UIButton = UIButton()
            
            let inputX: CGFloat = CGFloat(0)
            let inputY: CGFloat = CGFloat(superView.frame.size.height*CGFloat(index)*1/5)
            let inputW: CGFloat = CGFloat(superView.frame.size.width-7)
            let inputH: CGFloat = CGFloat((superView.frame.size.height-20)/5)
            
            b.frame = CGRect(x: inputX, y: inputY, width: inputW, height: inputH)
            b.setTitle(bTnList[index], for: UIControlState.normal)
            b.setTitleColor(.red, for: UIControlState.highlighted)
            b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            b.layer.cornerRadius = 0.5 * b.bounds.size.width
            b.layer.masksToBounds = true
            b.backgroundColor = UIColor.orange
            b.addTarget(self, action: #selector(calBtn(_:)), for: UIControlEvents.touchDown)
            superView.addSubview(b)
        }
        
    }
    /// 연산자 액션 함수
    ///
    /// - Parameter sender: ➗,✖️,➖,➕,= UIButton 인스턴스 중 1개
    @objc func calBtn(_ sender:UIButton){
        
        guard let calStr: String = sender.titleLabel?.text else {return}
        
        // 연산자가 "=" 이 아닌 것들만 oPerator 전역변수에 담아 둔다
        if calStr != "="{
            oPerator = calStr
        }
        // 숫자가 실수인지 정수인지 구분하여 타입 반환하기위한 변수 선언
        switch calStr {
        case "➗":
            firstNum = Double(rV.text!)!
            oPeratorCount = 1 //연산자가 눌려진 뒤 다시 숫자를 입력 할 수 있도록
        case "✖️":
            firstNum = Double(rV.text!)!
            oPeratorCount = 1 //연산자가 눌려진 뒤 다시 숫자를 입력 할 수 있도록
        case "➖":
            firstNum = Double(rV.text!)!
            oPeratorCount = 1 //연산자가 눌려진 뒤 다시 숫자를 입력 할 수 있도록
        case "➕":
            firstNum = Double(rV.text!)!
            oPeratorCount = 1 //연산자가 눌려진 뒤 다시 숫자를 입력 할 수 있도록
        case "=":
            // 연산 로직 실행 및 연산 결과값 저장
            switch oPerator{
            case "➗":
                resultNum = Double(firstNum / secondNum)
            case "✖️":
                resultNum = Double(firstNum * secondNum)
            case "➖":
                resultNum = Double(firstNum - secondNum)
            case "➕":
                resultNum = Double(firstNum + secondNum)
            default:
                break
            }
            
            // Double?을 unwrapping 해서 변수에 담고 소수점 뒤 자리가 있으면 그대로 String으로 캐스팅
            // 만약 소수점 뒤 자리가 없으면 Int 캐스팅 후 다시 String 캐스팅!
            if let unwrappedResultNum: Double = resultNum as? Double {
                var resultStr: String = ""
                if unwrappedResultNum.truncatingRemainder(dividingBy: 1) > 0 {
                    resultStr = String(unwrappedResultNum)
                }else{
                    resultStr = String(Int(unwrappedResultNum))
                }
                // 결과 텍스트로 연산 결과 값 저장
                rV.text! = resultStr
            }
            // 결과를 받으면 결과 뷰 텍스트를 제외하고 모든 변수 초기화
            clearWhenResultBtn()
            
        default:
            break
        }
    }
    /// 3-1. 숫자 버튼 영역 만들기 함수
    ///
    /// - Returns: 숫자 영역 뷰
    func makeNumberView() -> UIView{
        
        let inputX: CGFloat = CGFloat(0)
        let inputY: CGFloat = CGFloat(view.frame.size.height/3 + (view.frame.size.height*2/3)/5)
        let inputW: CGFloat = CGFloat(view.frame.size.width*3/4)
        let inputH: CGFloat = CGFloat(view.frame.size.height*2/3 - (view.frame.size.height*2/3)*(2/5))
        
        let v: UIView = UIView()
        v.frame = CGRect(x: inputX , y:inputY ,width: inputW, height: inputH)
        v.backgroundColor = UIColor.black
        v.alpha = 0.8
        view.addSubview(v)
        return v
        
    }
    
    /// 3-2. 숫자 버튼 만들기 함수
    func makeNumberBtn(){
        
        let superView: UIView = makeNumberView()
        
        for index1 in 0..<3 {
            
            let row = index1 % 3
            
            for index2 in 0..<3{
                
                let col = index2 % 3
                
                let inputX: CGFloat = CGFloat(superView.frame.size.width*CGFloat(col)/3)
                let inputY: CGFloat = CGFloat(superView.frame.size.height*CGFloat(row)/3)
                let inputW: CGFloat = CGFloat((superView.frame.size.width-20)/3)
                let inputH: CGFloat = CGFloat((superView.frame.size.height-15)/3)
                
                let b: UIButton = UIButton()
                b.frame = CGRect(x: inputX, y: inputY, width: inputW, height: inputH)
                
                switch (index1,index2){
                case (0,0):
                    b.setTitle("1", for: UIControlState.normal)
                case (0,1):
                    b.setTitle("2", for: UIControlState.normal)
                case (0,2):
                    b.setTitle("3", for: UIControlState.normal)
                case (1,0):
                    b.setTitle("4", for: UIControlState.normal)
                case (1,1):
                    b.setTitle("5", for: UIControlState.normal)
                case (1,2):
                    b.setTitle("6", for: UIControlState.normal)
                case (2,0):
                    b.setTitle("7", for: UIControlState.normal)
                case (2,1):
                    b.setTitle("8", for: UIControlState.normal)
                case (2,2):
                    b.setTitle("9", for: UIControlState.normal)
                default:
                    break
                }
                b.setTitleColor(.orange, for: UIControlState.highlighted)
                b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
                b.layer.cornerRadius = 0.5 * b.bounds.size.width
                b.layer.masksToBounds = true
                b.addTarget(self, action: #selector(self.btnNum(_:)), for: UIControlEvents.touchDown)
                b.backgroundColor = UIColor.gray
                superView.addSubview(b)
            }
        }
    }
    
    /// 숫자(1~9) 버튼 액션 함수
    ///
    /// - Parameter sender: 숫자(1~9) 버튼 UIButton 인스턴스 중 1개
    @objc func btnNum(_ sender:UIButton){
        
        if let inputStr: String = sender.titleLabel?.text{
            
            // 연산자 버튼이 눌리지 않았을 때
            if oPerator == ""{
                
                // 뷰 텍스트 "0"인 경우 한번 초기화 해주고 숫자 버튼을 입력한다
                if rV.text! == "0"{
                    rV.text! = ""
                    rV.text! += inputStr
                    // 첫번째 숫자를 변수를 담는다
                    firstNum = Double(rV.text!)!
                }else{
                    rV.text! += inputStr
                    // 첫번째 숫자를 변수를 담는다
                    firstNum = Double(rV.text!)!
                }
                
            // 연산자 버튼이 눌려진 후
            }else{
                
                // 연산자 버튼을 누르고 난뒤 숫자 버튼을 누를 때 결과뷰의 text 값 초기화는
                // 한번만 실행된다 *oPeratorCount 전역 변수 활용
                if  oPeratorCount == 1  {
                    rV.text! = ""
                    oPeratorCount = 0
                }
                rV.text! += inputStr // 입력된 값을 뷰 텍스트에 붙인다
                
                // 결과 뷰 텍스트의 첫번째 자리가 0 그리고 전체 자리수가 1보다 크고 "0." 을 포함하지 않는 경우에만 맨 앞자리에 있는 0을 제거한다
                if rV.text![rV.text!.startIndex] == "0" && rV.text!.count > 1 && rV.text!.contains("0.") == false {
                    let firstNumStr = rV.text![rV.text!.startIndex]
                    if firstNumStr == "0"{
                        rV.text!.remove(at: rV.text!.startIndex)
                    }
                }
                // 두번째 숫자 입력
                secondNum = Double(rV.text!)!
                
            }
        }
    }
    
    /// 4-1. 숫자 0 과 . 버튼의 영역 뷰 만들기 함수
    ///
    /// - Returns: 숫자 0 , . 버튼의 영역 뷰
    func numberZeroAndDotView() -> UIView{
        
        let inputX: CGFloat = CGFloat(0)
        let inputY: CGFloat = CGFloat(view.frame.size.height/3 + (view.frame.size.height*2/3)*4/5)
        let inputW: CGFloat = CGFloat(view.frame.size.width*3/4)
        let inputH: CGFloat = CGFloat((view.frame.size.height*2/3)/5)
        
        let v: UIView = UIView()
        
        v.frame = CGRect(x: inputX, y: inputY, width: inputW, height: inputH)
        v.backgroundColor = .black
        v.alpha = 0.8
        view.addSubview(v)
        
        return v
    }
    
    /// 4-2. 숫자 0, . 버튼 만들기 함수.
    func zeroAndDotBtn(){
        
        let superView = numberZeroAndDotView()
        
        let inputX1: CGFloat = CGFloat(0)
        let inputY1: CGFloat = CGFloat(0)
        let inputW1: CGFloat = CGFloat((superView.frame.size.width-15)*2/3)
        let inputH1: CGFloat = CGFloat(superView.frame.size.height-5)
        
        let b: UIButton = UIButton()
        
        b.frame = CGRect(x: inputX1, y: inputY1, width: inputW1, height: inputH1)
        b.backgroundColor = .gray
        b.setTitle("0", for: UIControlState.normal)
        b.setTitleColor(.orange, for: UIControlState.highlighted)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        b.layer.cornerRadius = 0.2 * b.bounds.size.width
        b.layer.masksToBounds = true
        b.addTarget(self, action: #selector(zeroAndDotBtnAction(_:)), for: UIControlEvents.touchDown)
        superView.addSubview(b)
        
        let inputX2: CGFloat = CGFloat(superView.frame.size.width*2/3)
        let inputY2: CGFloat = CGFloat(0)
        let inputW2: CGFloat = CGFloat((superView.frame.size.width-20)*1/3)
        let inputH2: CGFloat = CGFloat(superView.frame.size.height-5)
        
        let b1: UIButton = UIButton()
        
        b1.frame = CGRect(x: inputX2, y: inputY2, width: inputW2, height: inputH2)
        b1.backgroundColor = .gray
        b1.setTitle(".", for: UIControlState.normal)
        b1.setTitleColor(.orange, for: UIControlState.highlighted)
        b1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        b1.layer.cornerRadius = 0.5 * b1.bounds.size.width
        b1.layer.masksToBounds = true
        b1.addTarget(self, action: #selector(zeroAndDotBtnAction(_:)), for: UIControlEvents.touchDown)
        superView.addSubview(b1)
        
    }
    
    @objc func zeroAndDotBtnAction(_ sender:UIButton) {
   
        if let inputStr: String = sender.titleLabel?.text{
        
           //한번이라도 . 이 눌려졌다면 그 이후로는 .이 들어오면 rV.text 에 붙이지 않는다
            if rV.text!.contains(".") == true && inputStr == "." {
             return
            }
                if oPerator == ""{// 연산자 버튼이 눌리지 않았을 때
                   
                    rV.text! += inputStr
                   
                    if rV.text![rV.text!.startIndex] == "0" && rV.text!.count > 1 && rV.text!.contains("0.") == false {
                        let firstNumStr = rV.text![rV.text!.startIndex]
                        if firstNumStr == "0"{
                            rV.text!.remove(at: rV.text!.startIndex)
                        }
                    }
                    
                    if rV.text!.contains("0.") == false {
                      return
                    }else{
                        firstNum = Double(rV.text!)!
                    }
                    
                }else{// 연산자 버튼이 눌려진 후
                    
                    // 연산자 버튼을 누르고 난뒤 숫자 버튼을 누를 때 결과뷰의 text 값 초기화는
                    // 한번만 실행된다 *oPeratorCount 전역 변수 활용
                    if  oPeratorCount == 1  {
                        rV.text! = ""
                        oPeratorCount = 0
                    }
                    
                    rV.text! += inputStr
                    
                    if rV.text![rV.text!.startIndex] == "0" && rV.text!.count > 1 && rV.text!.contains("0.") == false {
                        let firstNumStr = rV.text![rV.text!.startIndex]
                        if firstNumStr == "0"{
                            rV.text!.remove(at: rV.text!.startIndex)
                        }
                    }
                        // 두번째 숫자 입력
                        secondNum = Double(rV.text!)!
                    
                }
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
