//
//  PlayViewController.swift
//  BlackJack21
//
//  Created by richard oh on 2018. 2. 17..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

     private var title1: UILabel?
     private var playBtn: UIButton?
     private var createdByLb: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        creatStartView()
        
    }
    
    func creatStartView(){
        
        title1 = UILabel()
        title1?.frame = CGRect(x: view.frame.size.width/2 - 175, y: view.frame.size.height/4, width: 350, height: 150)
        title1?.text = "BlackJack 21"
        title1?.textColor = .black
        title1?.textAlignment = NSTextAlignment.center
        title1?.font = UIFont(name: "Baskerville-BoldItalic", size: 50)
        view.addSubview(title1!)
        
        
        playBtn = UIButton()
        playBtn?.frame = CGRect(x: view.frame.size.width/2 - 40, y: view.frame.size.height/2 - 45, width: 80, height: 50)
        playBtn?.backgroundColor = UIColor.orange
        playBtn?.layer.cornerRadius = 15
        playBtn?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        playBtn?.setTitle("PLAY", for: .normal)
        playBtn?.setTitleColor(.white, for: .normal)
        playBtn?.addTarget(self, action: #selector(moveToViewController(_ :)), for: .touchDown)
        view.addSubview(playBtn!)
        
        createdByLb = UILabel()
        createdByLb?.text = "Created by WonSeok Oh \n2018.2.19"
        createdByLb?.numberOfLines = 2
        createdByLb?.frame = CGRect(x: view.frame.size.width/2 - 150, y: view.frame.size.height*(3/4), width: 300, height: 50)
        createdByLb?.textAlignment = NSTextAlignment.center
        createdByLb?.textColor = .white
        createdByLb?.font = UIFont(name: "HelveticaNeue", size: 12)
        view.addSubview(createdByLb!)
        
        
        view.backgroundColor = UIColor.darkGray
    }
    
    @objc func moveToViewController(_ sender: UIButton){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "ViewController")
        nextVC.modalTransitionStyle = .partialCurl
        self.present(nextVC, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
