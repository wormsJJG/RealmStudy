//
//  HomeViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    let realm = try! Realm()
    @IBOutlet weak var tableView: UITableView!
    var user: UserDB!
    let dismissVC: Notification.Name = Notification.Name("dismiss");

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(user.name)님의 버킷 리스트"
        tableView.reloadData()
        let addButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(plusBucekList))
        navigationItem.rightBarButtonItem = addButton
        NotificationCenter.default.addObserver(self, selector: #selector(self.didDismissPostCommentNotification(_:)), name: dismissVC, object: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc fileprivate func plusBucekList(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyboard.instantiateViewController(withIdentifier: "addBucketList") as! addBucketListViewController
        addVC.user = user
        present(addVC, animated: true, completion: nil)
    }
    @objc func didDismissPostCommentNotification(_ noti: Notification) {
            user = realm.object(ofType: UserDB.self, forPrimaryKey: user.id)
            tableView.reloadData()
        }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.bucketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! titleTableViewCell
        cell.titleLabel.text = user.bucketList[indexPath.row].title
        return cell
    }
    
    
}
