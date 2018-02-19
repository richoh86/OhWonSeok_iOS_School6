//
//  PlayerView.swift
//  BlackJack21
//
//  Created by richard oh on 2018. 2. 17..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation
import UIKit

class PlayerView: UIView {
    
    var delegate: PlayerViewDelegate?

    private var firstCard: UIImageView?
    private var secondCard: UIImageView?
    private var playerCnt: UILabel?
    
    private var hitBtn: UIButton?
    private var stayBtn: UIButton?
    private var doubleBtn: UIButton?
    
    private var fiveDollarBtn: UIButton?
    private var twentyFiveDollarBtn: UIButton?
    
    private var betMoneyAmount: UILabel?
    private var playerMoney: UILabel?
    
    // player 표시
    private var playerLB: UILabel?
    
    var plM: String?{
        get{
            
            return playerMoney?.text
        }
        set{
            playerMoney?.text = newValue
        }
    }
    
    var betM: String?{
        get{
            return betMoneyAmount?.text
        }
        set{
            betMoneyAmount?.text = newValue
        }
    }
    
    var pCnt: String?{
        get{
            return playerCnt?.text
        }
        set{
            playerCnt?.text = ""
            playerCnt?.text = newValue
        }
        
    }
    
    var fcImg:UIImage?{
        
        get{
            return firstCard?.image
        }
        set{
            firstCard?.image = newValue
        }
    }
    
    var scImg:UIImage?{
        
        get{
            
            return secondCard?.image
        }
        set{
            
            secondCard?.image = newValue
        }
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatPlayerView()
        updatePlayerLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatPlayerView(){
        
        firstCard = UIImageView()
        self.addSubview(firstCard!)
        
        secondCard = UIImageView()
        self.addSubview(secondCard!)
        
        playerCnt = UILabel()
        playerCnt?.textColor = UIColor.black
        playerCnt?.textAlignment = .right
        playerCnt?.font = UIFont(name: "Baskerville-BoldItalic", size: 15)
        self.addSubview(playerCnt!)
        
        hitBtn = UIButton()
        hitBtn?.setTitle("HIT", for: .normal)
        hitBtn?.setTitleColor(.white, for: .normal)
        hitBtn?.backgroundColor = UIColor.black
        hitBtn?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        hitBtn?.titleLabel?.textAlignment = NSTextAlignment.center
        hitBtn?.addTarget(self, action: #selector(hitAction(_:)), for: .touchDown)
        hitBtn?.layer.cornerRadius = 35
        hitBtn?.alpha = 0.8
        self.addSubview(hitBtn!)
        
        stayBtn = UIButton()
        stayBtn?.setTitle("STAY", for: .normal)
        stayBtn?.setTitleColor(.white, for: .normal)
        stayBtn?.backgroundColor = UIColor.black
        stayBtn?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        stayBtn?.titleLabel?.textAlignment = NSTextAlignment.center
        stayBtn?.addTarget(self, action: #selector(stayAction(_:)), for: .touchDown)
        stayBtn?.layer.cornerRadius = 35
        stayBtn?.alpha = 0.8
        self.addSubview(stayBtn!)
        
        doubleBtn = UIButton()
        doubleBtn?.setTitle("DOUBLE", for: .normal)
        doubleBtn?.setTitleColor(.white, for: .normal)
        doubleBtn?.backgroundColor = UIColor.black
        doubleBtn?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        doubleBtn?.titleLabel?.textAlignment = NSTextAlignment.center
        doubleBtn?.addTarget(self, action: #selector(doubleAction(_:)), for: .touchDown)
        doubleBtn?.layer.cornerRadius = 35
        doubleBtn?.isHidden = true
        doubleBtn?.alpha = 0.8
        self.addSubview(doubleBtn!)
        
        fiveDollarBtn = UIButton()
        fiveDollarBtn?.setTitle("$5", for: .normal)
        fiveDollarBtn?.setTitleColor(.black, for: .normal)
        fiveDollarBtn?.backgroundColor = UIColor.red
        fiveDollarBtn?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        fiveDollarBtn?.titleLabel?.textAlignment = NSTextAlignment.center
        fiveDollarBtn?.addTarget(self, action: #selector(fiveAction(_:)), for: .touchDown)
        fiveDollarBtn?.layer.cornerRadius = 35
        //        fiveDollarBtn?.isHidden = true
        fiveDollarBtn?.alpha = 0.8
        self.addSubview(fiveDollarBtn!)
        
        //
        twentyFiveDollarBtn = UIButton()
        twentyFiveDollarBtn?.setTitle("$25", for: .normal)
        twentyFiveDollarBtn?.setTitleColor(.black, for: .normal)
        twentyFiveDollarBtn?.backgroundColor = UIColor.green
        twentyFiveDollarBtn?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        twentyFiveDollarBtn?.titleLabel?.textAlignment = NSTextAlignment.center
        twentyFiveDollarBtn?.addTarget(self, action: #selector(twentyFiveAction(_:)), for: .touchDown)
        twentyFiveDollarBtn?.layer.cornerRadius = 35
        //        fiveDollarBtn?.isHidden = true
        twentyFiveDollarBtn?.alpha = 0.8
        self.addSubview(twentyFiveDollarBtn!)
        
        // 배팅 금액 표시
        betMoneyAmount = UILabel()
        betMoneyAmount?.text = "Bet Amount \n$0"
        betMoneyAmount?.numberOfLines = 2
        betMoneyAmount?.textColor = UIColor.black
        betMoneyAmount?.textAlignment = NSTextAlignment.center
        betMoneyAmount?.font = UIFont(name: "Baskerville-BoldItalic", size: 15)
        self.addSubview(betMoneyAmount!)
        
        playerMoney = UILabel()
        playerMoney?.text = "Player Money \n$10,000"
        playerMoney?.numberOfLines = 2
        playerMoney?.textColor = UIColor.black
        playerMoney?.textAlignment = NSTextAlignment.center
        playerMoney?.font = UIFont(name: "Baskerville-BoldItalic", size: 15)
        self.addSubview(playerMoney!)
        
        // player 표시
        playerLB = UILabel()
        playerLB?.text = "Player"
        playerLB?.textColor = UIColor.blue
        playerLB?.textAlignment = NSTextAlignment.center
        playerLB?.font = UIFont(name: "Baskerville-BoldItalic", size: 60)
        playerLB?.alpha = 0.5
        self.addSubview(playerLB!)
        
    }
    
    func updatePlayerLayout(){
        
        // 카드 이미지용 프레임용 상수 선언
        let leftmargin: CGFloat = 10
        let topmargin: CGFloat = 40
        let widthOfCard: CGFloat = 60
        
        // 게임 시작시 받는 첫번째 두번째 카드 뷰 프레임
        firstCard?.frame = CGRect(x: leftmargin, y: topmargin, width: 60, height: 90)
        secondCard?.frame = CGRect(x: leftmargin*2 + widthOfCard, y: topmargin, width: 60, height: 90)
        
        // Player count 숫자 뷰 프레임
        playerCnt?.frame = CGRect(x: self.frame.size.width - (150+leftmargin), y: 0, width: 150, height: 40)

        // hit, stay, double 버튼 뷰 프레임
        hitBtn?.frame = CGRect(x: 10, y: (topmargin*2) + 210, width: 70, height: 70)
        stayBtn?.frame = CGRect(x: 10 + 70 + 5 , y: (topmargin*2) + 210, width: 70, height: 70)
        doubleBtn?.frame = CGRect(x: 10 + 70 + 5 + 70 + 5 , y: (topmargin*2) + 210, width: 70, height: 70)
        
        fiveDollarBtn?.frame = CGRect(x: 10 + 70 + 5 + 70 + 5 + 70 + 25 , y: (topmargin*2) + 210, width: 70, height: 70)
        twentyFiveDollarBtn?.frame = CGRect(x: 10 + 70 + 5 + 70 + 5 + 70 + 25 + 70 + 5 , y: (topmargin*2) + 210, width: 70, height: 70)
        
        betMoneyAmount?.frame = CGRect(x: 10, y: (topmargin*2) + 145, width: 200, height: 50)
        playerMoney?.frame = CGRect(x: 10 + 70 + 5 + 70 + 5 + 70, y: (topmargin*2) + 145, width: 200, height: 50)
        
        
        // player 표시
        playerLB?.frame = CGRect(x: (self.frame.size.width/2) - CGFloat(100), y: (self.frame.size.height/2) - CGFloat(50), width: 200, height: 100)
     
    }
    
    
    @objc func hitAction(_ sender: UIButton){
        let num: Int = 0
        delegate?.hitBtnAction(num: num)
    }
    
    @objc func stayAction(_ sender: UIButton){
        delegate?.stayBtnAction()
    }
    
    @objc func doubleAction (_ sender: UIButton){
        delegate?.doubleBtnAction()
    }
    
    @objc func fiveAction(_ sender: UIButton){
        delegate?.fiveDollarBtnAction()
    }
    
    @objc func twentyFiveAction(_ sender: UIButton){
        delegate?.twentyFiveDollarBtnAction()
    }
    
    
}

protocol PlayerViewDelegate {

    func hitBtnAction(num: Int)
    func stayBtnAction()
    func doubleBtnAction()
    
    func fiveDollarBtnAction()
    func twentyFiveDollarBtnAction()
    
}
