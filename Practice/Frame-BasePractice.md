# Frame-Base Practice Code

## ViewController

> ItemView 클래스에 구현된 함수들과 프로퍼티를 활용하여 ViewController에서 화면상으로 뿌려주는 코드입니다

~~~
//
//  ViewController.swift
//  FrameBasePractice1
//
//  Created by richard oh on 2018. 2. 4..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeView(num: 6)
    
    }
    
    
    func makeView(num: Int){
        
        for index in 0..<num{
            
            let row: CGFloat = CGFloat(index / 2)
            let col: CGFloat = CGFloat(index % 2)
            let margin: CGFloat = 20
            
            let itemView = ItemView(frame: CGRect(x: margin*(col+1) + (col*150),
                                                  y: margin*(row+1) + (row*150),
                                                  width: 150,
                                                  height: 150))
            
            itemView.image = UIImage(named: "images1.jpeg")
            itemView.title = "제목없음"
            itemView.des = "추가설명"
            itemView.index = index
            itemView.addTarget(self, action: #selector(actionBtn(_:)), for: UIControlEvents.touchUpInside)
            view.addSubview(itemView)
     
        }
        
    }
    
    @objc func actionBtn(_ sender: UIButton){
        
        print("\(sender.tag + 1)번째 아이템을 선택했습니다!")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
~~~

## ItemView.swift

> ItemView 클래스는 기본적으로 UIView 클래스를 상속받고, 저장프로퍼티, 연산프로퍼티 그리고 커스텀 함수를 통해서 다양한 뷰를 생성하는 로직이 구현되어 있습니다 

~~~
//
//  ItemView.swift
//  FrameBasePractice1
//
//  Created by richard oh on 2018. 2. 4..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class ItemView: UIView {

    private var backgroundImageV: UIImageView?
    private var titleLabel: UILabel?
    private var descriptionLabel: UILabel?
    private var actionBtn: UIButton?
    
    var index: Int = 0{
        didSet{
            actionBtn?.tag = index
        }
    }
    
    var image: UIImage?{
        
        get{
          return backgroundImageV?.image
        }
        set{
            backgroundImageV?.image = newValue
        }
        
    }
    var title: String?{
        get{
            return titleLabel?.text
        }
        
        set{
            titleLabel?.text = newValue
        }
        
    }
    
    var des: String?{
        get{
            return descriptionLabel?.text
        }
        set{
            descriptionLabel?.text = newValue
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatView()
        updateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func creatView(){
        
        backgroundImageV = UIImageView()
        
        if backgroundImageV != nil{
        self.addSubview(backgroundImageV!)
        }
        
        titleLabel = UILabel()
        titleLabel?.font = UIFont.systemFont(ofSize: 30)
        titleLabel?.textColor = .white
        titleLabel?.textAlignment = NSTextAlignment.center
        
        if titleLabel != nil {
        self.addSubview(titleLabel!)
        }
        
        descriptionLabel = UILabel()
        descriptionLabel?.textColor = .white
        descriptionLabel?.font = UIFont.systemFont(ofSize: 20)
        descriptionLabel?.textAlignment = NSTextAlignment.right
        
        if descriptionLabel != nil {
        self.addSubview(descriptionLabel!)
        }
        
        actionBtn = UIButton()
        if actionBtn != nil {
        self.addSubview(actionBtn!)
        }
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents){
        
        actionBtn?.addTarget(target, action: action, for: controlEvents)
    }
  
    func updateLayout(){
        
        backgroundImageV?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        titleLabel?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height*2/3)
        descriptionLabel?.frame = CGRect(x: 0, y: self.frame.size.height*2/3, width: self.frame.size.width, height: self.frame.size.height/3)
        
        actionBtn?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    
}
~~~