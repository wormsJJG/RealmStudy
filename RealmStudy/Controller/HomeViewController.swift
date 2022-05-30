//
//  HomeViewController.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import UIKit

class HomeViewController: UIViewController {
    var user: UserDB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(user.name)님의 버킷 리스트"
        print(user.gender, user.age)
    }
}
