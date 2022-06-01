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
        let logOutButton = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logOut))
        logOutButton.tintColor = .red
        let addButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(plusBucekList))
        navigationItem.hidesBackButton = true
        navigationItem.title = "\(user.name)님의 버킷 리스트"
        tableView.reloadData()
        navigationItem.leftBarButtonItem = logOutButton
        navigationItem.rightBarButtonItem = addButton
        NotificationCenter.default.addObserver(self, selector: #selector(self.didDismissPostCommentNotification(_:)), name: dismissVC, object: nil)
    }
    @objc fileprivate func plusBucekList(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyboard.instantiateViewController(withIdentifier: "addBucketList") as! AddBucketListViewController
        addVC.user = user
        present(addVC, animated: true, completion: nil)
    }
    @objc fileprivate func logOut(){
        navigationController?.popViewController(animated: true)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickCellAction(indexPath)
    }
    func clickCellAction(_ indexPath: IndexPath) {
        let detailAlert = UIAlertController(title: "자세히", message: user.bucketList[indexPath.row].desc, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default){ (action) in }
        let editAction = UIAlertAction(title: "편집", style: .destructive){ (action) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let editVC = storyboard.instantiateViewController(withIdentifier: "editBucketList") as! EditViewController
            editVC.user = self.user
            editVC.index = indexPath.row
            self.present(editVC, animated: true, completion: nil)
        }
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive){ (action) in
            try! self.realm.write {
                self.realm.delete(self.user.bucketList[indexPath.row])
            }
            self.tableView.reloadData()
        }
        detailAlert.addAction(okAction)
        detailAlert.addAction(editAction)
        detailAlert.addAction(deleteAction)
        present(detailAlert, animated: false, completion: nil)
    }
    
    
}
