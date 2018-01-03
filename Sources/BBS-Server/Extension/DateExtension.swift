//
//  DateExtension.swift
//  BBS-ServerPackageDescription
//
//  Created by pengpeng on 2017/11/21.
//


import Foundation

/// 获取当前时间戳 秒级
func getTimeStamp() -> Int {
    let now = Date()

    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dformatter.timeZone = TimeZone(secondsFromGMT: 8 * 3600)
    
//      [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8 * 3600]];
    
//    print("当前日期时间：\(dformatter.string(from: now))")

    let timeInterval:TimeInterval = now.timeIntervalSince1970
    let timeStamp = Int(timeInterval)
//    print("当前时间的时间戳：\(timeStamp)")
    return timeStamp
}

