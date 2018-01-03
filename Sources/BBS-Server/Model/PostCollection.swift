//
//  PostCollection.swift
//  BBS-ServerPackageDescription
//
//  Created by pengpeng on 2017/12/22.
//

import StORM

class PostCollection: BaseMySQLStORM {

    override func table() -> String {
        return "post_collection"
    }
    
    var id : Int = 0
    var post_id : Int64 = 0
    var forum_id : Int64 = 0
    var user_id : Int64 = 0
    
    override func to(_ this: StORMRow) {
        id = Int(this.data["id"] as? Int64 ?? 0)
        post_id = this.data["post_id"] as? Int64 ?? 0
        forum_id = this.data["forum_id"] as? Int64 ?? 0
        user_id = this.data["user_id"] as? Int64 ?? 0
    }
    
    func rows() -> [PostCollection] {
        var rows = [PostCollection]()
        for i in 0..<self.results.rows.count {
            let row = PostCollection()
            
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
}

