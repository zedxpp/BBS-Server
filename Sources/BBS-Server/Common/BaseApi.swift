//
//  BaseApi.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/12/2.
//

import PerfectLib
import PerfectHTTP

class BaseApi {
    
    /// 请求参数检查
    /// - Returns: 为true表示可用, false不可用
    static func paramsCheckUp(request: HTTPRequest, response: HTTPResponse, result: Result, allParams allKeys: [String], optionalParams: [String] = []) -> Bool {
        //        let allKeys = ["title", "content", "pics"]
        
        // 判断参数为空的情况
        if request.params().isEmpty {
            result.failure(code: .parameterNil)
            try! response.setBody(json: result.toDict())
            response.completed()
            return false
        }
        
        var parameterError = false
        

        // 入参值不能为空, 并且所有入参key不能是不符合要求的
        for (key, value) in request.params() {
            if let _ = allKeys.index(of: key) {
//                printLog("\(key) = \(value)")
//                printLog(value.count)
                
                if value.isEmpty || value == "Optional(\"\")" {
                    result.failure(code: .parameterError, reasonStr: "\(key)不能为空")
                    try! response.setBody(json: result.toDict())
                    response.completed()
                    return false
                }
            } else {
                
                // 判断可选参数数组不是空, 并且能找到可选参数, 否则标记为参数异常
                if !optionalParams.isEmpty && optionalParams.index(of: key) != nil {
                    continue
                }
                
                parameterError = true
                break
            }
        }
        
        // 入参不符合要求
        if parameterError {
            result.failure(code: .parameterError)
            try! response.setBody(json: result.toDict())
            response.completed()
            return false
        }
        
        return true
    }
    
    /// 服务器内部错误处理
    static func serverErrorHandle(result: Result, response: HTTPResponse)
    {
        result.failure(code: .serverError)
        try! response.setBody(json: result.toDict())
    }
}
