//
//  User.swift
//  BBS-ServerPackageDescription
//
//  Created by pengpeng on 2017/12/9.
//

import StORM

class User: BaseMySQLStORM {
    var id : Int = 0
    var user_phone: String = ""
    var user_pass_word: String = ""
    var user_nick_name: String = ""
    var user_create_time: Int64 = 0
    var user_icon: String = ""
    
    override func to(_ this: StORMRow) {
        id = Int(this.data["id"] as? Int64 ?? 0)
        user_phone = this.data["user_phone"] as? String ?? ""
        user_pass_word = this.data["user_pass_word"] as? String ?? ""
        user_nick_name = this.data["user_nick_name"] as? String ?? ""
        user_create_time = this.data["user_create_time"] as? Int64 ?? 0
        user_icon = this.data["user_icon"] as? String ?? ""
    }
    
    func rows() -> [User] {
        var rows = [User]()
        for i in 0..<self.results.rows.count {
            let row = User()
            
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
    
    override func objToDictIgnoreVarArray() -> [String]? {
        return ["user_pass_word"]
    }
}
