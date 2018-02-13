//
//  MainViewController.swift
//  FireBaseStudy1
//
//  Created by richard oh on 2018. 2. 12..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

// 메인화면 로직
class MainViewController: UIViewController {
    
    
    /// 메인 화면 로그아웃 버튼 액션 (로그인 화면으로 돌아감)
    ///
    /// - Parameter sender: 로그아웃 버튼
    @IBAction func logoutBtnAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        
        self.present(loginVC, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
