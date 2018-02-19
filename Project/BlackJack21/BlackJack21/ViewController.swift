//
//  ViewController.swift
//  BlackJack21
//
//  Created by richard oh on 2018. 2. 17..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PlayerViewDelegate {
    
    // 이미지 파일 경로
    let pathStr: String = "/BlackJack21/Img/"
    
    // player, dealer 총 카운팅 숫자를 위한 변수
    var playerCnt: Int = 0
    var dealerCnt: Int = 0
    
    // 첫번째 player 카드 2장
    var playerCard1: String?
    var playerCard2: String?
    
    // 첫번째 dealer 카드 2장
    var dealerCard1: String?
    var dealerCard2: String?
    
    // player hit 버튼 액션을 위한 변수 선언
    var hitCardStr: String?
    var hitCnt: Int = 0
    var hitCntTemp: Int = 0
    var hitCnt1Temp: Int = 0
    
    // dealer hit 카드 변수 선언
    var dHitcardStr: String?
    var indexTemp: CGFloat = 0
    
    // 각 뷰 선언
    var pView: PlayerView!
    var dView: DealerView!
    
    // Ace 카드 1 또는 11 로직 구현을 위한 Array
    var aceCardsArrayP: [String] = [] // player
    var aceCardsArrayD: [String] = [] // dealer
    
    // hitcard 이미지 뷰 초기화 용 배열
    var hitCardPArray: [UIImageView] = []
    var hitCardDArray: [UIImageView] = []
    
    // 배팅 금액을 보여주기 위한 변수
    var totalBetAmount: Int = 0
    // 플레이어의 돈은 게임이 시작되면 1만달러가 주어진다
    var totalPlayerMoney: Int = 10000
    
    // 카드 숫자 Dictionary
    var cardsDic: [String:Int] = ["2_of_clubs": 2, "2_of_diamonds": 2 , "2_of_hearts": 2, "2_of_spades": 2,"3_of_clubs": 3, "3_of_diamonds": 3 , "3_of_hearts": 3, "3_of_spades": 3,"4_of_clubs": 4, "4_of_diamonds": 4 , "4_of_hearts": 4, "4_of_spades": 4,"5_of_clubs": 5, "5_of_diamonds": 5 , "5_of_hearts": 5, "5_of_spades": 5,"6_of_clubs": 6, "6_of_diamonds": 6 , "6_of_hearts": 6, "6_of_spades": 6,"7_of_clubs": 7, "7_of_diamonds": 7 , "7_of_hearts": 7, "7_of_spades": 7,"8_of_clubs": 8, "8_of_diamonds": 8 , "8_of_hearts": 8, "8_of_spades": 8,"9_of_clubs": 9, "9_of_diamonds": 9 , "9_of_hearts": 9, "9_of_spades": 9,"10_of_clubs": 10, "10_of_diamonds": 10 , "10_of_hearts": 10, "10_of_spades": 10,"ace_of_clubs": 11,"ace_of_diamonds": 11,"ace_of_hearts": 11,"ace_of_spades": 11,"jack_of_clubs2":10,"jack_of_diamonds2":10,"jack_of_spades2":10,"jack_of_hearts2":10,"king_of_clubs2":10,"king_of_diamonds2":10,"king_of_spades2":10,"king_of_hearts2":10,"queen_of_clubs2":10,"queen_of_diamonds2":10,"queen_of_spades2":10,"queen_of_hearts2":10]
    
    // 카드 숫자 딕셔너리 원래 데이터 임시 저장소
    var cardsDicTemp: [String: Int] = [:]
    
    // 카드 이름 Array
    var cardsArray: [String] = ["2_of_clubs", "2_of_diamonds", "2_of_hearts", "2_of_spades","3_of_clubs", "3_of_diamonds", "3_of_hearts", "3_of_spades","4_of_clubs", "4_of_diamonds" , "4_of_hearts", "4_of_spades","5_of_clubs", "5_of_diamonds", "5_of_hearts", "5_of_spades","6_of_clubs", "6_of_diamonds", "6_of_hearts", "6_of_spades","7_of_clubs", "7_of_diamonds", "7_of_hearts", "7_of_spades","8_of_clubs", "8_of_diamonds", "8_of_hearts", "8_of_spades","9_of_clubs", "9_of_diamonds", "9_of_hearts", "9_of_spades","10_of_clubs", "10_of_diamonds", "10_of_hearts","10_of_spades","ace_of_clubs","ace_of_diamonds","ace_of_hearts","ace_of_spades","jack_of_clubs2","jack_of_diamonds2","jack_of_spades2","jack_of_hearts2","king_of_clubs2","king_of_diamonds2","king_of_spades2","king_of_hearts2","queen_of_clubs2","queen_of_diamonds2","queen_of_spades2","queen_of_hearts2"]
    
    // 카드 숫자 배열 원래 데이터 임시 저장소
    var cardsArrayTemp: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //0. 카드를 모두 사용해서 게임이 종료되고 다시 시작될 경우,
        //카드가 소진되는 경우를 대비해서 무조건 임시 저장소에 전체 카드를 담아두고 시작한다
        reFillCards()
        
        //1. 카드를 랜덤하게 뽑아서 딜러와 플레이어에게 할당
        cardsShuffle()
        
        //2. player의 뷰를 생성
        createPlayerView()
        
        //3. dealer의 뷰를 생성
        creatDealerView()
        
    }
    
    // 미리 전체 카드를 임시 배열에 담아두고
    // 카드가 모두 소진되는 경우 사용한다
    func reFillCards(){
        
        cardsDicTemp = cardsDic
        cardsArrayTemp = cardsArray
        
    }
    
    /// 카드가 소진되는 경우 반드시 호출해줘야한다
    func cardFill(){
        
            if self.cardsArray.count == 0{
                self.cardsArray = self.cardsArrayTemp
                self.cardsDic = self.cardsDicTemp
            }
    }
    
    /// 카드를 플레이어와 딜리에게 할당하는 함수
    func cardsShuffle(){
        
        cardFill()
        // 1. Player 카드 show
        // 랜덤 인덱스로 카드 이미지와 해당 카드의 숫자 카운팅 (첫번째카드)
        let randomIndex1 = Int(arc4random_uniform(UInt32(cardsArray.count)))
        playerCard1 = cardsArray[randomIndex1]
        playerCnt += cardsDic[playerCard1!]!
        
        // 이미 나온 카드는 없애준다
        cardsArray.remove(at: randomIndex1)
        
        cardFill()
        // 랜덤 인덱스로 카드 이미지와 해당 카드의 숫자 카운팅 (두번째카드)
        let randomIndex2 = Int(arc4random_uniform(UInt32(cardsArray.count)))
        
        playerCard2 = cardsArray[randomIndex2]
        playerCnt += cardsDic[playerCard2!]!
        cardsArray.remove(at: randomIndex2)
        
        cardFill()
        // 2. Dealer 카드 show
        let randomIndex3 = Int(arc4random_uniform(UInt32(cardsArray.count)))
        
        dealerCard1 = cardsArray[randomIndex3]
        dealerCnt += cardsDic[dealerCard1!]!
        
        // 이미 나온 카드는 없애준다
        cardsArray.remove(at: randomIndex3)
        
        cardFill()
        // 랜덤 인덱스로 카드 이미지와 해당 카드의 숫자 카운팅 (두번째카드)
        let randomIndex4 = Int(arc4random_uniform(UInt32(cardsArray.count)))
        
        dealerCard2 = cardsArray[randomIndex4]
        dealerCnt += cardsDic[dealerCard2!]!
        cardsArray.remove(at: randomIndex4)
        
    }
    
    // Dealer View
    func creatDealerView(){
        
        dView = DealerView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2))
        dView.fcImg = UIImage(named: "back", in: Bundle.init(path: pathStr), compatibleWith: nil)
        dView.scImg = UIImage(named: dealerCard2!, in: Bundle.init(path: pathStr), compatibleWith: nil)
        dView.backgroundColor = UIColor(displayP3Red: 0, green: 102/255, blue: 51/255, alpha: 1.0)
        dView.dCnt = "Dealer Count: ? "
        view.addSubview(dView)
        
    }
    
    // Player View
    func createPlayerView(){
        
        pView = PlayerView(frame: CGRect(x: 0, y: view.frame.size.height/2, width: view.frame.size.width, height: view.frame.size.height/2))
        pView.fcImg = UIImage(named: playerCard1!, in: Bundle.init(path: pathStr), compatibleWith: nil)
        pView.scImg = UIImage(named: playerCard2!, in: Bundle.init(path: pathStr), compatibleWith: nil)
        pView.backgroundColor = UIColor(displayP3Red: 0, green: 204/255, blue: 102/255, alpha: 1.0)
        pView.pCnt = "Player Count: " + String(playerCnt)
        pView.delegate = self
        view.addSubview(pView)
        
    }
    
    // 뷰의 이미지와 텍스트를 초기화 (카드이미지는 새롭게 할당된 카드로 변경)
    func resetView(){
        
        dView.fcImg = UIImage(named: "back", in: Bundle.init(path: pathStr), compatibleWith: nil)
        dView.scImg = UIImage(named: dealerCard2!, in: Bundle.init(path: pathStr), compatibleWith: nil)
        dView.dCnt = "Dealer Count: ? "
        
        pView.fcImg = UIImage(named: playerCard1!, in: Bundle.init(path: pathStr), compatibleWith: nil)
        pView.scImg = UIImage(named: playerCard2!, in: Bundle.init(path: pathStr), compatibleWith: nil)
        pView.pCnt = "Player Count: " + String(playerCnt)
        
    }
    
    /// HIT 버튼 액션 함수
    ///
    /// - Parameter num: 버튼을 누른 횟수
    func hitBtnAction(num: Int) {
        print("hit button pushed")
        
        // 배팅 금액 확인
        if totalBetAmount < 5 {
            let alertVC = UIAlertController(title: "최소 배팅 금액 $5", message: "배팅하세요!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                
            })
            alertVC.addAction(action1)
            self.present(alertVC, animated: true, completion: nil)
        return
        }
        
        // hit button pushed number count
        if hitCntTemp == 0{
            hitCntTemp = num + 1
            hitCnt = num
        }else{
            hitCnt = hitCntTemp
            hitCntTemp += 1
        }
        
        let cgfhitCnt: CGFloat = CGFloat(hitCnt)
        
        // 1. Player 카드 show
        
        // hit를 하다가 중간에 카드가 다 떨어지는 경우 다시 카드를 채운다
        cardFill()
        // 랜덤 인덱스로 카드 이미지와 해당 카드의 숫자 카운팅 (첫번째카드)
        let randomIndex1 = Int(arc4random_uniform(UInt32(cardsArray.count)))
        hitCardStr = cardsArray[randomIndex1]
        
        // Ace 카드 확인을 위해서 선언된 배열에 카드 명 담기
        if aceCardsArrayP.count == 0 {
            aceCardsArrayP.append(playerCard1!)
            aceCardsArrayP.append(playerCard2!)
        }
        aceCardsArrayP.append(hitCardStr!)
        
        // 두개의 카운트 숫자를 확인하기 위한 변수
        var totalNum1: Int = 0
        var totalNum2: Int = 0
        var totalNum3: Int = 0
        
        // Ace 카드 수량 체크
        var cnt = 0
        
        // 배열에 담은 카드 숫자 카운팅
        for aceCards in aceCardsArrayP{
            
            print(aceCards)
            if aceCards.hasPrefix("a"){
                // Ace 카드 수량 체크
                cnt += 1
                // Ace를 11로 카운트
                totalNum1 += cardsDic[aceCards]!
                // Ace를 1로 카운트
                totalNum2 += 1
                // ACE가 2장 이상인 경우 Ace 한장만 11로 카운트하고 나머지는 모두 1로 카운트
                if cnt > 1 && cnt < 5{
                    totalNum3 += 1
                }else{
                    totalNum3 += cardsDic[aceCards]!
                }
            }else{
                totalNum1 += cardsDic[aceCards]!
                totalNum2 += cardsDic[aceCards]!
                totalNum3 += cardsDic[aceCards]!
            }
        }
        
        print("ace카드 수량: ",cnt)
        print(totalNum1 ,totalNum2, totalNum3)
        
        // 카드 카운팅이 2개 다 22 보다 작으면 21에 가까운 큰 숫자를 카운트 숫자로 정한다
        if totalNum1 < 22 && totalNum2 < 22 && totalNum3 < 22{
            
            if totalNum1 > totalNum2 && totalNum1 > totalNum3 {
                playerCnt = totalNum1
            }else if totalNum2 > totalNum1 && totalNum2 > totalNum3{
                playerCnt = totalNum2
            }else{
                playerCnt = totalNum3
            }
        
        }else{
        
            // 두개 토탈 숫자 중에 작은 숫자를 playerCnt에 담는다
            // 같으면 아무 숫자를 담아도 상관없다
            if totalNum1 > totalNum2 && totalNum3 > totalNum2{
                playerCnt = totalNum2
            }else if totalNum2 > totalNum1 && totalNum3 > totalNum1{
                playerCnt = totalNum1
            }else{
                playerCnt = totalNum3
            }
        }
        
        print(playerCnt)
        
        // 이미 나온 카드는 없애준다
        cardsArray.remove(at: randomIndex1) 
        
        let gameCardWidth: CGFloat = 10 + 60 + 10 + 60
        let rightMargin: CGFloat = 10
        let width: CGFloat = 60
        
        // hitCntTemp가 3일때 까지만
        if hitCntTemp < 4 {
            
            // hitCnt를 기준으로 뷰를 옆으로 쌓는다
            let hitCardP: UIImageView = UIImageView(frame: CGRect(x: gameCardWidth + rightMargin*(cgfhitCnt + 1) + width*cgfhitCnt, y: 40, width: 60, height: 90))
            hitCardP.image = UIImage(named: hitCardStr! , in: Bundle.init(path: pathStr), compatibleWith: nil)
            pView.addSubview(hitCardP)
            hitCardPArray.append(hitCardP)
            
        }else{ // 4부터는 다시 아래 행으로 카드가 나온다
            
            hitCnt = hitCnt1Temp
            hitCnt1Temp += 1
            let cgfhitCnt: CGFloat = CGFloat(hitCnt)
            
            let hitCardP: UIImageView = UIImageView(frame: CGRect(x: rightMargin*(cgfhitCnt + 1) + width*cgfhitCnt, y: 140, width: 60, height: 90))
            hitCardP.image = UIImage(named: hitCardStr! , in: Bundle.init(path: pathStr), compatibleWith: nil)
            pView.addSubview(hitCardP)
            hitCardPArray.append(hitCardP)
        }
        
        // 총 player의 카운트를 표시해준다
        pView.pCnt = "Player Count: " + String(playerCnt)
        
        // player 가 21을 넘으면 패배
        // 게임을 계속 할 것인지 여부를 alert 메세지로 결정히도록 함
        if playerCnt > 21 {
            
            let alertVC = UIAlertController(title: "Player Bust: \(playerCnt) \nDealer Won", message: "게임을 계속 하시겠습니까?", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "예", style: .default, handler: { (action) in
                
                self.reShuffleCards()
                self.totalBetAmount = 0
                self.pView.betM = "Bet Amount \n$\(self.totalBetAmount)"
                
            })
            
            let action2  = UIAlertAction(title: "아니요", style: .cancel, handler: { (action) in
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let pVC = storyboard.instantiateViewController(withIdentifier: "PlayViewController")
                self.present(pVC, animated: true, completion: nil)
            })
            
            alertVC.addAction(action1)
            alertVC.addAction(action2)
            self.present(alertVC, animated: true, completion: nil)
            
        }
        
    }
    
    // player가 카드를 그만 받기 위해 stay 버튼을 누르면 딜러 카드 카운팅을 시작
    func stayBtnAction() {
        
        print("stay button pushed")
        
        // 배팅 금액 확인
        if totalBetAmount < 5 {
            let alertVC = UIAlertController(title: "최소 배팅 금액 $5", message: "배팅하세요!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                
            })
            alertVC.addAction(action1)
            self.present(alertVC, animated: true, completion: nil)
            return
        }
        
        // 뒷면 카드 이미지를 원래 할당된 카드 이미지로 변환
        dView.fcImg = UIImage(named: dealerCard1!, in: Bundle.init(path: pathStr), compatibleWith: nil)
        
        // dealerCnt 가 16보다 크고 22보다 작을 때는 hit을 멈추고 카드 카운트를 비교해서 승자를 가림
        if dealerCnt > 16 && dealerCnt < 22 {
            
            if playerCnt > dealerCnt{ // PLAYER WIN
                
                playerWinAlert()
                return // 함수 종료 (게임 종료)
                
            }else if dealerCnt > playerCnt { // DEALER WIN
                
                dealerWinAlert()
                return // 함수 종료 (게임 종료)
                
            }else{ // EVEN GAME
                
                playerDealerEvenAlert()
                return // 함수 종료 (게임 종료)
            }
            
        }
        
        // 화면에 표현 가능한 최대 카드 갯수 8개
        for index in 0..<8 {
            
            // hit를 하다가 중간에 카드가 다 떨어지는 경우 다시 카드를 채운다
            cardFill()
            
            let randomIndex = Int(arc4random_uniform(UInt32(cardsArray.count)))
            dHitcardStr = cardsArray[randomIndex]
            
            let gameCardWidth: CGFloat = 10 + 60 + 10 + 60
            let rightMargin: CGFloat = 10
            let width: CGFloat = 60
            let cgIndex: CGFloat = CGFloat(index)
            
            // 기본적으로 카드는 8번까지 친다! 다음 조건문 전까지는..
            if index < 3 { // 첫번째 줄 카드 뷰
                
                let hitCardD: UIImageView = UIImageView(frame: CGRect(x: gameCardWidth + rightMargin*(cgIndex + 1) + width*cgIndex, y: 40, width: 60, height: 90))
                hitCardD.image = UIImage(named: dHitcardStr! , in: Bundle.init(path: pathStr), compatibleWith: nil)
                dView.addSubview(hitCardD)
                hitCardDArray.append(hitCardD)
                
            } else { // 두번재 줄 카드 뷰
                
                let hitCardD: UIImageView = UIImageView(frame: CGRect(x: rightMargin*(indexTemp + 1) + width*indexTemp, y: 140, width: 60, height: 90))
                hitCardD.image = UIImage(named: dHitcardStr! , in: Bundle.init(path: pathStr), compatibleWith: nil)
                dView.addSubview(hitCardD)
                hitCardDArray.append(hitCardD)
                
                indexTemp += 1
                
            }
            
            // Ace 카드 확인을 위해서 선언된 배열에 카드 명 담기
            if aceCardsArrayD.count == 0 {
                aceCardsArrayD.append(dealerCard1!)
                aceCardsArrayD.append(dealerCard2!)
            }
            aceCardsArrayD.append(dHitcardStr!)
            
            // 3개의 카운트 숫자를 확인하기 위한 변수
            var totalNum1: Int = 0
            var totalNum2: Int = 0
            var totalNum3: Int = 0
            
            // Ace 카드 수량 체크
            var cnt = 0
            
            // 배열에 담은 카드 숫자 카운팅
            for aceCards in aceCardsArrayD{
                
                print(aceCards)
                if aceCards.hasPrefix("a"){
                    // Ace 카드 수량 체크
                    cnt += 1
                    // Ace를 11로 카운트
                    totalNum1 += cardsDic[aceCards]!
                    // Ace를 1로 카운트
                    totalNum2 += 1
                    // ACE가 2장 이상인 경우 Ace 한장만 11로 카운트하고 나머지는 모두 1로 카운트
                    if cnt > 1 && cnt < 5{
                        totalNum3 += 1
                    }else{
                        totalNum3 += cardsDic[aceCards]!
                    }
                }else{
                    totalNum1 += cardsDic[aceCards]!
                    totalNum2 += cardsDic[aceCards]!
                    totalNum3 += cardsDic[aceCards]!
                }
            }
            
            print("ace카드 수량: ",cnt)
            print(totalNum1 ,totalNum2, totalNum3)
            
            // 카드 카운팅이 2개 다 22 보다 작으면 21에 가까운 큰 숫자를 카운트 숫자로 정한다
            if totalNum1 < 22 && totalNum2 < 22 && totalNum3 < 22{
                
                if totalNum1 > totalNum2 && totalNum1 > totalNum3 {
                    dealerCnt = totalNum1
                }else if totalNum2 > totalNum1 && totalNum2 > totalNum3{
                    dealerCnt = totalNum2
                }else{
                    dealerCnt = totalNum3
                }
                
            }else{
                
                // 두개 토탈 숫자 중에 작은 숫자를 playerCnt에 담는다
                // 같으면 아무 숫자를 담아도 상관없다
                if totalNum1 > totalNum2 && totalNum3 > totalNum2{
                    dealerCnt = totalNum2
                }else if totalNum2 > totalNum1 && totalNum3 > totalNum1{
                    dealerCnt = totalNum1
                }else{
                    dealerCnt = totalNum3
                }
            }
            
            // 이미 나온 카드는 없애준다
            cardsArray.remove(at: randomIndex)
            
            // Dealer 카운트가 17 ~ 21인 경우 카운트 비교 후 루프를 빠져나온다
            if dealerCnt > 16 && dealerCnt < 22 {
                
                if dealerCnt == 17 && cnt > 0 && dealerCnt == totalNum1 {
                    
                    // 소프트 17은 딜러의 경우 무조건 hit 해야한다
                    // 소프트 17: Ace 카드가 11로 카운트되면서 총 카운트의 합이 17인 경우
                    
                }else{
                    
                    compareDPCnt()
                    break
                    
                }
                
                
                // Dealer bust
            }else if dealerCnt > 21{
                
                let alertVC = UIAlertController(title: "Dealer Bust: \(dealerCnt) \nPlayer Won", message: "게임을 계속 하시겠습니까?", preferredStyle: .alert)
                
                let action1 = UIAlertAction(title: "예", style: .default, handler: { (action) in
                    
                    self.reShuffleCards()
                    
                    self.totalPlayerMoney += self.totalBetAmount*2
                    self.totalBetAmount = 0
                    self.pView.betM = "Bet Amount \n$\(self.totalBetAmount)"
                    self.pView.plM = "Player Money \n$\(self.totalPlayerMoney)"
                    
                })
                
                let action2  = UIAlertAction(title: "아니요", style: .cancel, handler: { (action) in
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let pVC = storyboard.instantiateViewController(withIdentifier: "PlayViewController")
                    self.present(pVC, animated: true, completion: nil)
                })
                
                alertVC.addAction(action1)
                alertVC.addAction(action2)
                self.present(alertVC, animated: true, completion: nil)
                break
                
            }
            // 최종 딜러 카운트
            dView.dCnt = "Dealer Count: \(dealerCnt)"
            
        }
        
    }
    
    /// Double 버튼 액션 함수
    func doubleBtnAction() {
        print("double button pushed")
    }
    
    // $5 버튼 액션 함수
    func fiveDollarBtnAction() {
        print("five button pushed")
        
        if totalPlayerMoney < 5{
            
            let alertVC = UIAlertController(title: "잔액이 부족해서 더 이상 플레이 할 수 없습니다", message: "게임을 다시 시작하시겠습니까?", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "예", style: .default, handler: { (action) in
             
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let pVC = storyboard.instantiateViewController(withIdentifier: "ViewController")
                self.present(pVC, animated: true, completion: nil)
                
            })
            
            let action2  = UIAlertAction(title: "아니요", style: .cancel, handler: { (action) in
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let pVC = storyboard.instantiateViewController(withIdentifier: "PlayViewController")
                self.present(pVC, animated: true, completion: nil)
                
            })
            alertVC.addAction(action1)
            alertVC.addAction(action2)
            self.present(alertVC, animated: true, completion: nil)
            return
        }
        
        totalBetAmount += 5
        totalPlayerMoney -= 5
        
        pView.betM = "Bet Amount: \n$\(totalBetAmount)"
        pView.plM = "Player Money \n$\(totalPlayerMoney)"
    }
    // $25 버튼 액션 함수
    func twentyFiveDollarBtnAction() {
        print("twentyFive button pushed")
        
        if totalPlayerMoney < 25{
            
            let alertVC = UIAlertController(title: "잔액이 부족합니다", message: "보유금액: $\(totalPlayerMoney)", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                
            })
    
            alertVC.addAction(action1)
            self.present(alertVC, animated: true, completion: nil)
            return
        }
        
        totalBetAmount += 25
        totalPlayerMoney -= 25
        
        pView.betM = "Bet Amount: \n$\(totalBetAmount)"
        pView.plM = "Player Money \n$\(totalPlayerMoney)"
    }
    
    
    // dealer가 승리했을 때 Alert 메세지
    func dealerWinAlert(){
        let alertVC = UIAlertController(title: "Dealer: \(dealerCnt) Won \nPlayer: \(playerCnt) Lose", message: "게임을 계속 하시겠습니까?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "예", style: .default, handler: { (action) in
            
            self.reShuffleCards()
            self.totalBetAmount = 0
            self.pView.betM = "Bet Amount \n$\(self.totalBetAmount)"
            
        })
        
        let action2  = UIAlertAction(title: "아니요", style: .cancel, handler: { (action) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let pVC = storyboard.instantiateViewController(withIdentifier: "PlayViewController")
            self.present(pVC, animated: true, completion: nil)
        })
        
        alertVC.addAction(action1)
        alertVC.addAction(action2)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    /// player가 승리했을 때 Alert 메세지
    func playerWinAlert(){
        
        let alertVC = UIAlertController(title: "Player: \(playerCnt) Won \nDealer: \(dealerCnt) Lose", message: "게임을 계속 하시겠습니까?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "예", style: .default, handler: { (action) in
            
            self.reShuffleCards()
            self.totalPlayerMoney += self.totalBetAmount*2
            self.totalBetAmount = 0
            self.pView.betM = "Bet Amount \n$\(self.totalBetAmount)"
            self.pView.plM = "Player Money \n$\(self.totalPlayerMoney)"
            
        })
        
        let action2  = UIAlertAction(title: "아니요", style: .cancel, handler: { (action) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let pVC = storyboard.instantiateViewController(withIdentifier: "PlayViewController")
            self.present(pVC, animated: true, completion: nil)
        })
        
        alertVC.addAction(action1)
        alertVC.addAction(action2)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    // player, dealer가 비겼을 때 Alert 메세지
    func playerDealerEvenAlert(){
        
        let alertVC = UIAlertController(title: "Dealer: \(dealerCnt) \nPlayer: \(playerCnt) \nEven Push!", message: "게임을 계속 하시겠습니까?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "예", style: .default, handler: { (action) in
        
            self.reShuffleCards()
            
        })
        
        let action2  = UIAlertAction(title: "아니요", style: .cancel, handler: { (action) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let pVC = storyboard.instantiateViewController(withIdentifier: "PlayViewController")
            self.present(pVC, animated: true, completion: nil)
        })
        
        alertVC.addAction(action1)
        alertVC.addAction(action2)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    /// player, dealer 카드 카운트 비교 함수
    func compareDPCnt(){
        
        if playerCnt > dealerCnt{ // PLAYER WIN
            playerWinAlert()
            return
            
        }else if dealerCnt > playerCnt { // DEALER WIN
            
            dealerWinAlert()
            return
            
        }else{ // EVEN GAME
            
            playerDealerEvenAlert()
            return
        }
    }
    
    /// 다음 게임으로 넘어갈 때 새로운 랜덤카드를 할당하고, 변수,배열들을 초기화
    func reShuffleCards(){
        
        // 카드가 소진되었는지 여부 확인
        // 카드가 아직 남아있는 경우
        if cardsArray.count > 0 {
            
            // 초기화
            reset()
            
        }else{// 카드가 남아있지 않은 경우
            
            // 카드가 소진되면 임시로 담아둔 배열에서 카드를 다시 담는다
            cardFill()
            
            // 초기화
            reset()
        }
    }
    
    /// 게임을 다시 시작할 때 리셋이 필요한 변수,배열 초기화
    func reset(){
        
        
        // 카운트 리셋
        playerCnt = 0
        dealerCnt = 0
        
        // ace 카드 확인용 배열 리셋
        aceCardsArrayD.removeAll()
        aceCardsArrayP.removeAll()
        
        // 다시 랜덤 카드를 뽑아서 딜러와 플레이어에게 할당
        cardsShuffle()
        
        // 뷰를 다시 게임시작 상태로 리셋
        resetView()
        
        // player가 hit한 카드들의 뷰를 다 지워준다 (리셋)
        for phitcard in hitCardPArray{
            phitcard.removeFromSuperview()
        }
        
        // 카드 뷰 생성을 위한 로직에서 사용되는 변수를 리셋
        hitCntTemp = 0
        hitCnt1Temp = 0
        indexTemp = 0
        
        // dealer가 hit한 카드들의 뷰를 다 지워준다 (리셋)
        for dhitcard in hitCardDArray {
            dhitcard.removeFromSuperview()
        }
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

