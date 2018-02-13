//
//  ViewController.swift
//  FireBaseStudy1
//
//  Created by richard oh on 2018. 2. 12..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit
import Firebase

// 회원가입 화면 로직
class RegViewController: UIViewController {
    
    @IBOutlet var statusUI: UILabel!
    @IBOutlet var idTF: UITextField!
    @IBOutlet var pwTF: UITextField!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    
    var db: Firestore!
    var docRef: DocumentReference!
    
    @IBAction func saveBtnAction(_ sender: Any) {
        
        guard let idTextfield = idTF.text, !idTextfield.isEmpty else{return}
        guard let pwTextfield = pwTF.text, !pwTextfield.isEmpty else{return}
        guard let nameTextfield = nameTF.text, !nameTextfield.isEmpty else{return}
        guard let phoneTextfield = phoneTF.text, !phoneTextfield.isEmpty else{return}
        
        let dataToSave:  [String: Any] = ["id": idTextfield, "pw": pwTextfield,"name": nameTextfield, "phone": phoneTextfield]
        
        // 아이디 중복 체크!
        db.collection("Members").whereField("id", isEqualTo: idTextfield).getDocuments { (querySnapShot, error) in
            if let error = error{
                print("Error adding document:\(error)")
            }else{
                
                if let cnt: Int = querySnapShot?.documents.count, cnt > 0 {
                    let alertVC = UIAlertController(title: "아이디 중복", message: "사용중인 아이디입니다", preferredStyle: UIAlertControllerStyle.alert)
                    let action1 = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: { (action) in
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let loginVC = storyboard.instantiateViewController(withIdentifier: "RegViewController")
                        self.present(loginVC, animated: true, completion: nil)
                        
                    })
                    alertVC.addAction(action1)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
        
        // 입력된 정보 Insert
        docRef = db.collection("Members").addDocument(data: dataToSave)
        {err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                
                let alertVC = UIAlertController(title: "가입완료", message: "로그인 페이지로 돌아갑니다", preferredStyle: UIAlertControllerStyle.alert)
                let action1 = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: { (action) in
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
                    self.present(loginVC, animated: true, completion: nil)
                })
                alertVC.addAction(action1)
                self.present(alertVC, animated: true, completion: nil)
            }
        }
    }
    
    /// 취소버튼을 누르면 로그인 화면으로 복귀
    ///
    /// - Parameter sender: 취소버튼
    @IBAction func cancelBtnAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginVC, animated: true, completion: nil)
        
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

