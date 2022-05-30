//
//  HomeViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var InsertIdTextField: UITextField!
    @IBOutlet weak var InsertPassWordTextField: UITextField!
    let realm = try! Realm()
    var id = "";
    var passWord = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        self.id = InsertIdTextField.text ?? "nil"
        self.passWord = InsertPassWordTextField.text ?? "nil"
    }
    let user = realm.object(ofType: UserDB.self, forPrimaryKey: id)
   
}
