//
//  Comment.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/12/21.
//

import StORM

class Comment: BaseMySQLStORM {
    var id : Int = 0
    var comment_content : String = ""
    var comment_create_time : Int64 = 0
    var comment_quote_id : Int64 = 0
    var comment_floor : Int64 = 0
    var comment_user_id : Int64 = 0
    var comment_post_id: Int64 = 0

    
    override func to(_ this: StORMRow) {
        id = Int(this.data["id"] as? Int64 ?? 0)
        comment_content = this.data["comment_content"] as? String ?? ""
        comment_create_time = this.data["comment_create_time"] as? Int64 ?? 0
        comment_quote_id = this.data["comment_quote_id"] as? Int64 ?? 0
        comment_floor = this.data["comment_floor"] as? Int64 ?? 0
        comment_user_id = this.data["comment_user_id"] as? Int64 ?? 0
        comment_post_id = this.data["comment_post_id"] as? Int64 ?? 0
    }
    
    func rows() -> [Comment] {
        var rows = [Comment]()
        for i in 0..<self.results.rows.count {
            let row = Comment()
            
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
}
