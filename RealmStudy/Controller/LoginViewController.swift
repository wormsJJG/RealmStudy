//
//  HomeViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import UIKit
import RealmSwift
import SwiftUI

class LoginViewController: UIViewController{
    @IBOutlet weak var InsertIdTextField: UITextField!
    @IBOutlet weak var InsertPassWordTextField: UITextField!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    @IBAction func login(_ sender: Any) {
        let user = realm.object(ofType: UserDB.self, forPrimaryKey: InsertIdTextField.text ?? "nil")
        if(InsertPassWordTextField.text ?? "nil"==user?.passWord && InsertIdTextField.text ?? "nil" == user?.id){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
            homeVC.user = user
            navigationController?.pushViewController(homeVC, animated: true)
        }else{
            print("아이디 또는 비번 틀림")
        }
    }
    
}
