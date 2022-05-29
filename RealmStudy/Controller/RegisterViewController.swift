//
//  RegisterViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var InsertIdTextField: UITextField!
    @IBOutlet weak var InsertPassWordTextField: UITextField!
    @IBOutlet weak var InsertNameTextField: UITextField!
    @IBOutlet weak var InsertGenderTextField: UITextField!
    @IBOutlet weak var InsertAgeTextField: UITextField!
    let realm = try! Realm()
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
        self.id = InsertIdTextField.text ?? "nil"
        self.passWord = InsertPassWordTextField.text ?? "nil"
        self.name = InsertNameTextField.text ?? "nil"
        self.gender = InsertGenderTextField.text ?? "nil"
        self.age = Int(InsertAgeTextField.text!) ?? 0
        self.User = UserDB(id: id, passWord: passWord, name: name, gender: gender, age: age)
        try! realm.write {
            realm.add(User)
        }
    }
}
