//
//  Post.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/11/18.
//


import StORM

class Post: BaseMySQLStORM {
    var id : Int = 0
    var post_read_count : Int32 = 0
    var post_create_time : Int64 = 0
    var post_title : String = ""
    var post_content : String = ""
    var forum_id : Int64 = 0
    var post_content_pics: String = ""
    var post_create_user_id: Int64 = 0
    
    override func to(_ this: StORMRow) {
        id = Int(this.data["id"] as? Int64 ?? 0)
        post_read_count = this.data["post_read_count"] as? Int32 ?? 0
        post_create_time = this.data["post_create_time"] as? Int64 ?? 0
        post_title = this.data["post_title"] as? String ?? ""
        post_content = this.data["post_content"] as? String ?? ""
        forum_id = this.data["forum_id"] as? Int64 ?? 0
        post_content_pics = this.data["post_content_pics"] as? String ?? ""
        post_create_user_id = this.data["post_create_user_id"] as? Int64 ?? 0
    }

    func rows() -> [Post] {
        var rows = [Post]()
        for i in 0..<self.results.rows.count {
            let row = Post()

            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
}

//    public func text() -> (String, Any) {
//        let mirror = Mirror(reflecting: self)
//        var res: (String, String) = ("", "")
//        for case let (label?, value) in mirror.children {
////            return (label, modifyValue(value, forKey: label))
//            print("\(label) = \(value)")
//        }
//        return ("id", "unknown")
//    }

//class User: MySQLStORM {
//    // NOTE: 注意，第一个属性将会是数据表主索引。
//    var id              : Int32 = 0
//    var firstname       : String = ""
//    var lastname        : String = ""
//    var email           : String = ""
//
//    override open func table() -> String {
//        return "users"
//    }
//
//    override open func table() -> String {
////        return getTableName(aClass: Post.self)
//        return super.table()
//    }
//
//    override func to(_ this: StORMRow) {
//        //        id                = this.data["id"] as? Int ?? 0
//        id                = this.data["id"] as? Int32 ?? 0
//        firstname        = this.data["firstname"] as? String ?? ""
//        lastname        = this.data["lastname"] as? String ?? ""
//        email            = this.data["email"] as? String ?? ""
//    }
//
//    func rows() -> [User] {
//        var rows = [User]()
//        for i in 0..<self.results.rows.count {
//            let row = User()
//
//            row.to(self.results.rows[i])
//            rows.append(row)
//        }
//        return rows
//    }
//
//    func toDict() -> [String: Any] {
//        var dict = [String: Any]()
//        dict["id"] = self.id
//        dict["firstname"] = firstname
//        dict["lastname"] = lastname
//        dict["email"] = email
//        return dict
//    }
//
//    func toArrayDict() -> [[String: Any]] {
//        var arr = [[String: Any]]()
//
//        let objArr = self.rows()
//        for user in objArr {
//            arr.append(user.toDict())
//        }
//
//        return arr
//    }
//}
