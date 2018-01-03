//
//  Tool.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/11/18.
//


import Foundation
import PerfectLib

class Tool {
    
    static let projectName = "BBS_Server"

    static let rootPath = Dir.workingDir.path + "files/"
    
    static let imagesPath = Dir.workingDir.path + "files/images/"
    
    static var timeStamp: String {
        return String(Int(Date().timeIntervalSince1970))
    }
    
    static var date: String {
        let fm = DateFormatter()
        fm.dateFormat = "yyyyMMdd"
        fm.dateFormat = "yyyyMMddHHmmss"
        //fm.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //fm.timeZone = TimeZone(secondsFromGMT: 8 * 3600)
        fm.timeZone = TimeZone(identifier: "Asia/Shanghai")
        let str = fm.string(from: Date())
//        printLog(str)
        return str
    }
    
    
}

func printLog<T>(_ message: T,
                 file: String = #file,
                 method: String = #function,
                 line: Int = #line)
{
//    #if DEBUG
        print("\((file).lastFilePathComponent) [\(line)] \(method): \(message)")
//    #endif
}
