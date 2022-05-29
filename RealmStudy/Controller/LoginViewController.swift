//
//  HomeViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    let realm = try! Realm()
    @IBOutlet weak var InsertIdTextField: UITextField!
    @IBOutlet weak var InsertPassWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
