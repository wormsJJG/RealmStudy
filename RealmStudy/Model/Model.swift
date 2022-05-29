//
//  Model.swift
//  RealmStudy
//
//  Created by 정재근 on 2022/05/29.
//

import Foundation
import RealmSwift

class UserDB: Object{
    @objc dynamic var id: String = ""
    @objc dynamic var passWord: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var age: Int = 0
    let bucketList = List<BucketList>()
    
    var hasList: Bool{
        return bucketList.count > 0
    }
    
    convenience init(id: String, passWord: String, name: String, gender: String, age:Int){
        self.init()
        self.id = id
        self.passWord = passWord
        self.name = name
        self.gender = gender
        self.age = age
    }
    override class func primaryKey() -> String? {
        return "id"
    }
    override class func indexedProperties() -> [String] {
        return ["id","password","name","gender","age"]
    }
    
}
class BucketList: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var desc: String = ""
    
    convenience init(title: String, desc: String){
        self.init()
        self.title = title
        self.desc = desc
    }
}
