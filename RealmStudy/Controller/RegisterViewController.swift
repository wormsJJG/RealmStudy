//
//  RegisterViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var InsertIdTextField: UITextField!
    @IBOutlet weak var InsertPassWordTextField: UITextField!
    @IBOutlet weak var InsertNameTextField: UITextField!
    @IBOutlet weak var InsertGenderTextField: UITextField!
    @IBOutlet weak var InsertAgeTextField: UITextField!
    
    private let realm = try! Realm()
    var id: String = ""
    var passWord: String = ""
    var name: String = ""
    var gender: String = ""
    var age: Int = 0
    var User = UserDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonRegister(_ sender: Any) {
        if(InsertIdTextField.text==""){
            let ErrorAlert = UIAlertController(title: "아이디를 입력하세요.", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default){ (action) in }
            ErrorAlert.addAction(okAction)
            present(ErrorAlert, animated: true)
        } else if(InsertPassWordTextField.text==""){
            let ErrorAlert = UIAlertController(title: "비밀번호를 입력하세요.", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default){ (action) in }
            ErrorAlert.addAction(okAction)
            present(ErrorAlert, animated: true)
        } else if(InsertNameTextField.text==""){
            let ErrorAlert = UIAlertController(title: "이름을 입력하세요.", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default){ (action) in }
            ErrorAlert.addAction(okAction)
            present(ErrorAlert, animated: true)
        } else if(InsertGenderTextField.text==""){
            let ErrorAlert = UIAlertController(title: "성별을 입력하세요.", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default){ (action) in }
            ErrorAlert.addAction(okAction)
            present(ErrorAlert, animated: true)
        } else if(InsertAgeTextField.text==""){
            let ErrorAlert = UIAlertController(title: "나이를 입력하세요.", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default){ (action) in }
            ErrorAlert.addAction(okAction)
            present(ErrorAlert, animated: true)
        }else{
            self.id = InsertIdTextField.text ?? "nil"
            self.passWord = InsertPassWordTextField.text ?? "nil"
            self.name = InsertNameTextField.text ?? "nil"
            self.gender = InsertGenderTextField.text ?? "nil"
            self.age = Int(InsertAgeTextField.text!) ?? 0
            self.User = UserDB(id: id, passWord: passWord, name: name, gender: gender, age: age)
            try! realm.write {
                realm.add(User)
            }
            navigationController?.popViewController(animated: true)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        InsertIdTextField.delegate = self
        InsertPassWordTextField.delegate = self
        InsertAgeTextField.delegate = self
        InsertNameTextField.delegate = self
        InsertGenderTextField.delegate = self
        return true
    }
}
