//
//  Forum.swift
//  BBS-ServerPackageDescription
//
//  Created by pengpeng on 2017/11/21.
//



import StORM

class Forum: BaseMySQLStORM {
    var id : Int = 0
    var forum_create_time : Int64 = 0
    var forum_name : String = ""
    var forum_manager : String = ""
    var forum_icon: String = ""
    var forum_des: String = ""
    
    override func to(_ this: StORMRow) {
        id = Int(this.data["id"] as? Int64 ?? 0)
        forum_create_time = this.data["forum_create_time"] as? Int64 ?? 0
        forum_name = this.data["forum_name"] as? String ?? ""
        forum_manager = this.data["forum_manager"] as? String ?? ""
        forum_icon = this.data["forum_icon"] as? String ?? ""
        forum_des = this.data["forum_des"] as? String ?? ""
        
    }
    
    func rows() -> [Forum] {
        var rows = [Forum]()
        for i in 0..<self.results.rows.count {
            let row = Forum()
            
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
}
