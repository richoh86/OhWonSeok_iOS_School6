//
//  DealerView.swift
//  BlackJack21
//
//  Created by richard oh on 2018. 2. 17..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation
import UIKit

class DealerView: UIView {
    
    private var firstCard: UIImageView?
    private var secondCard: UIImageView?
    private var dealerCnt: UILabel?
    
    // dealer 표시
    private var dealerLB: UILabel?
    
    var dCnt: String?{
        get{
            return dealerCnt?.text
        }
        set{
            dealerCnt?.text = newValue
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
        creatDealerView()
        updateDealerLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatDealerView(){
        
        firstCard = UIImageView()
        self.addSubview(firstCard!)
        
        secondCard = UIImageView()
        self.addSubview(secondCard!)
        
        dealerCnt = UILabel()
        dealerCnt?.textColor = UIColor.black
        dealerCnt?.textAlignment = .left
        dealerCnt?.font = UIFont(name: "Baskerville-BoldItalic", size: 15)
        self.addSubview(dealerCnt!)
        
        // dealer 표시
        dealerLB = UILabel()
        dealerLB?.text = "Dealer"
        dealerLB?.font = UIFont(name: "Baskerville-BoldItalic", size: 60)
        dealerLB?.textColor = UIColor.red
        dealerLB?.textAlignment = NSTextAlignment.center
        dealerLB?.alpha = 0.8
        self.addSubview(dealerLB!)
        
    }
    
    func updateDealerLayout(){
        
        // 카드 이미지용
        let leftmargin: CGFloat = 10
        let topmargin: CGFloat = 40
        let bottommargin: CGFloat = 50
        let widthOfCard: CGFloat = 60
        
        firstCard?.frame = CGRect(x: leftmargin, y: topmargin, width: 60, height: 90)
        secondCard?.frame = CGRect(x: leftmargin*2 + widthOfCard, y: topmargin, width: 60, height: 90)
        
        dealerCnt?.frame = CGRect(x: leftmargin, y: self.frame.size.height - bottommargin, width: 150, height: 50)
        
        // dealer 표시
        dealerLB?.frame = CGRect(x: (self.frame.size.width/2) - CGFloat(100), y: (self.frame.size.height/2) - CGFloat(50), width: 200, height: 100)
    }
    
}
