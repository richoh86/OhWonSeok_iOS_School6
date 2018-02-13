//
//  LoginViewController.swift
//  FireBaseStudy1
//
//  Created by richard oh on 2018. 2. 12..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit
import Firebase

// 로그인 화면 로직
class LoginViewController: UIViewController {
    
    var db: Firestore!
    
    @IBOutlet var idForLogin: UITextField?
    @IBOutlet var pwForLogin: UITextField?
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
        // 로그인 아이디와 비밀번호가 입력되었는지 확인
        if let idCheck: String = idForLogin?.text, idCheck != "",
            let pwCheck: String = pwForLogin?.text, pwForLogin?.text != ""{
            
            // 입력된 id와 pw를 가지고 DataBase 검색
            db.collection("Members").whereField("id", isEqualTo: idCheck).whereField("pw", isEqualTo: pwCheck).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    // firebase의 Members 컬렉션에 해당 id와 pw 모두 만족하는 document의 갯수가 0보다 크면 로그인 성공
                    if let cnt: Int = querySnapshot?.documents.count, cnt > 0{
                        print("로그인 성공")
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")
                        self.present(mainVC, animated: true, completion: nil)
                        
                    }else{// 그 외의 경우 로그인 실패
                        print("로그인 실패")
                        let alertVC = UIAlertController(title: "메세지", message: "아이디 또는 비밀번호를 확인해주세요", preferredStyle: .alert)
                        let action1 = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                            
                        })
                        
                        alertVC.addAction(action1)
                        self.present(alertVC, animated: true, completion: nil)
                    }
                }
            }
        }else{// 로그인 아이디와 비밀번호가 입력되지 않은 경우 alert 메세지
            
            print("alert")
            
            let alertVC = UIAlertController(title: "메세지", message: "아이디 또는 비밀번호를 확인해주세요", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                
            })
            
            alertVC.addAction(action1)
            self.present(alertVC, animated: true, completion: nil)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // [START setup]
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
