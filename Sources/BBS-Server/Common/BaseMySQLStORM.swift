//
//  BaseMySQLStORM.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/11/18.
//


//import PerfectMySQL
import MySQLStORM
//import StORM

class BaseMySQLStORM: MySQLStORM {
    
    func objToDictIgnoreVarArray() -> [String]? {
        return nil
    }
    
    /// 根据对象类型获取全部是小写字母的数据库表名
    ///
    /// - Parameter aClass: 对象类型名
    /// - Returns: 数据库表名字符串
//    func getTableName(aClass: AnyClass) -> String {
//        let str = NSStringFromClass(aClass).stringByReplacing(string: Tool.projectName + ".", withString: "").lowercased()
//        return str
//    }
    
    
    /// 把属性名从带_的数据库字段名转换成驼峰命名
    ///
    /// - Parameter name: 属性名
    /// - Returns: 转换后的驼峰命名
    func propertyNameToHumpName(name: String) -> String {
        var res = ""
        if name.contains(string: "_") {
            let arr = name.components(separatedBy: "_")
            for (index, value) in arr.enumerated() {
                if index == 0 {
                    res += value
                    continue
                }
                res += value.capitalized
            }
        } else {
            res = name
        }
        return res
    }
    
    /// 将当前对象转换为驼峰命名的字典
    func objToDict(_ addElements: [String: Any]? = nil) -> [String: Any] {
        var dict = [String: Any]()
        
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            //            print("\(label) = \(value)")
            
            if label.isEmpty {
                continue
            }
            
            if let ignoreArr = objToDictIgnoreVarArray() {
                if ignoreArr.contains(label) {
                    continue
                }
            }
            
            let str = propertyNameToHumpName(name: label)
            //                if str.isEmpty {
            //                    continue
            //                } else {
            dict[str] = value
            //                }
            
        }
        
        if let elements = addElements {
            
            for (key, value) in elements {
                dict[key] = value
            }
        }
        
        return dict
    }
    
    /// 将对象数组转换成数组字典
    ///
    /// - Parameter objArr: 传入对象的rows()的返回值
    /// - Returns: 转换后的数组字典
    func objToArrayDict(objArr: [BaseMySQLStORM], _ addElements: [[String: Any]]? = nil) -> [[String: Any]] {
        var arr = [[String: Any]]()
        for (index, value) in objArr.enumerated() {
            
            
            if objArr.count == addElements?.count {
                if let element = addElements?[index] {
                    arr.append(value.objToDict(element))
                }
            } else {
                arr.append(value.objToDict())
            }
        }
        
        return arr
    }



}

extension BaseMySQLStORM {
//    /// 将当前对象转换为驼峰命名的字典
//    func objToDict(_ addArrayElements: [[String: Any]]) -> [String: Any] {
//        var dict = [String: Any]()
//
//        let mirror = Mirror(reflecting: self)
//        for case let (label?, value) in mirror.children {
//            //            print("\(label) = \(value)")
//
//            if label.isEmpty {
//                continue
//            }
//
//            if let ignoreArr = objToDictIgnoreVarArray() {
//                if ignoreArr.contains(label) {
//                    continue
//                }
//            }
//
//            let str = propertyNameToHumpName(name: label)
//            //                if str.isEmpty {
//            //                    continue
//            //                } else {
//            dict[str] = value
//            //                }
//
//        }
//
//        for (key, value) in addArrayElements {
//            dict[key] = value
//        }
//
//        return dict
//    }
//
//    /// 将对象数组转换成数组字典
//    ///
//    /// - Parameter objArr: 传入对象的rows()的返回值
//    /// - Returns: 转换后的数组字典
//    func objToArrayDict(objArr: [BaseMySQLStORM], _ addArrayElements: [[[String: Any]]]) -> [[String: Any]] {
//        var arr = [[String: Any]]()
//        for (index, value) in objArr.enumerated() {
//
//
//            if objArr.count == addArrayElements.count {
//                arr.append(value.objToDict(addArrayElements[index]))
//
//            } else {
//                arr.append(value.objToDict())
//            }
//        }
//
//        return arr
//    }
}

//    func objToArrayDict() -> [[String: Any]] {
//        var arr = [[String: Any]]()
//
//        for user in self.rows() {
//            arr.append(user.objToDict())
//        }
//
//        return arr
//    }

//var str = "aaa_bbb_ccc"
//var res = ""
//if str.contains(string: "_") {
//    
//    let arr = str.components(separatedBy: "_")
//    
//    
//    for (index, value) in arr.enumerated() {
//        if index == 0 {
//            res += value
//            continue
//        }
//        res += value.capitalized
//        //            print(value.capitalized)
//    }
//    //        print(arr)
//} else {
//    print("没有下划线")
//}
//
//print(res)

