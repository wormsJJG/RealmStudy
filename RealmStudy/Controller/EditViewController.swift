//
//  EditViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/06/01.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    let realm = try! Realm()
    var bucketList = BucketList()
    var index: Int?
    var user: UserDB!
    let dismissVC: Notification.Name = Notification.Name("dismiss");
    @IBOutlet weak var insertTitleTextField: UITextField!
    @IBOutlet weak var insertDetailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertTitleTextField.text = user.bucketList[index!].title
        insertDetailTextField.text = user.bucketList[index!].desc
        self.user = realm.object(ofType: UserDB.self, forPrimaryKey: user.id)
    }
    
    @IBAction func editButton(_ sender: Any) {
        bucketList.title = insertTitleTextField.text!
        bucketList.desc = insertDetailTextField.text!
        try! realm.write{
            user.bucketList[index!] = bucketList
        }
        NotificationCenter.default.post(name: dismissVC, object: nil, userInfo: nil)
        dismiss(animated: true)
    }
}
