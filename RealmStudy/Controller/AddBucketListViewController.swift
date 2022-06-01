//
//  addBucketListViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/31.
//

import UIKit
import RealmSwift

class AddBucketListViewController: UIViewController {
    let realm = try! Realm()
    var user: UserDB!
    var bucket: BucketList!
    let dismissVC: Notification.Name = Notification.Name("dismiss");
    @IBOutlet weak var inserTitleTextField: UITextField!
    @IBOutlet weak var insertDetailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = realm.object(ofType: UserDB.self, forPrimaryKey: user.id)
        self.bucket = BucketList()
    }
    
    @IBAction func addBucketList(_ sender: Any) {
        bucket.title = inserTitleTextField.text!
        bucket.desc = insertDetailTextField.text!
        try! realm.write{
            user.bucketList.append(bucket)
        }
        NotificationCenter.default.post(name: dismissVC, object: nil, userInfo: nil)
        dismiss(animated: true)
    }
}
