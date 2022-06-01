//
//  HomeViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import UIKit
import RealmSwift
import SwiftUI

class LoginViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var InsertIdTextField: UITextField!
    @IBOutlet weak var InsertPassWordTextField: UITextField!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    override func viewWillAppear(_ animated: Bool) {
        InsertIdTextField.text = ""
        InsertPassWordTextField.text = ""
        InsertIdTextField.delegate = self
        InsertPassWordTextField.delegate = self
    }
    @IBAction func login(_ sender: Any) {
        if(InsertIdTextField.text == ""&&InsertPassWordTextField.text == ""){
            let ErrorAlert = UIAlertController(title: "아이디 비밀번호를 입력해주세요.", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default){ (action) in }
            ErrorAlert.addAction(okAction)
            present(ErrorAlert, animated: true)
        }else{
            let user = realm.object(ofType: UserDB.self, forPrimaryKey: InsertIdTextField.text ?? "nil")
            if(InsertPassWordTextField.text ?? "nil"==user?.passWord && InsertIdTextField.text ?? "nil" == user?.id){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
                homeVC.user = user
                navigationController?.pushViewController(homeVC, animated: true)
            }else{
                let ErrorAlert = UIAlertController(title: "아이디 또는 비밀번호가 일치하지 않습니다.", message: "", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "확인", style: .default){ (action) in }
                ErrorAlert.addAction(okAction)
                present(ErrorAlert, animated: true)
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        InsertIdTextField.resignFirstResponder()
        InsertPassWordTextField.resignFirstResponder()
        return true
    }
    
}
