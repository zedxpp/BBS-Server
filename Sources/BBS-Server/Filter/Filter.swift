//
//  Filter.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/12/12.
//


import PerfectHTTP

struct Filter: HTTPRequestFilter {
    func filter(request: HTTPRequest, response: HTTPResponse, callback: (HTTPRequestFilterResult) -> ()) {
        
        //            print(request.params())
        //            if let _ = request.param(name: "a") {
        //                print("包含a")
        //                callback(.execute(request, response))
        //            } else {
        //                print("不包含a")
        //
        //                response.setHeader(.contentType, value: "application/json")
        //                try! response.setBody(json: ["res": "不存在的"])
        //
        //                callback(.halt(request, response))
        //            }
        callback(.execute(request, response))
    }
}

struct Filter404: HTTPResponseFilter {
    func filterBody(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        callback(.continue)
    }
    
    func filterHeaders(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        if case .notFound = response.status {
            response.setBody(string: "404. That’s an error. The requested URL \(response.request.path) was not found on this server.")
            
            response.setHeader(.contentLength, value: "\(response.bodyBytes.count)")
            callback(.done)
        } else {
            callback(.continue)
        }
    }
}

struct FilterResult: HTTPResponseFilter {
    func filterBody(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        callback(.continue)
    }
    
    func filterHeaders(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        if case .ok = response.status {
            
            
            
            //                response.setBody(string: str)
            
            //                printLog(String(bytes: response.bodyBytes, encoding: String.Encoding.utf8))
            
            //                response.setBody(json: <#T##JSONConvertible#>)
            //                printLog(response.bodyBytes)
            
            
            //                response.appendBody(string: "\"codeMsg\": \"请求成功了吗\"")
            //                response.setBody(string: "404. That’s an error. The requested URL \(response.request.path) was not found on this server.")
            ////
            //                response.setHeader(.contentLength, value: "\(response.bodyBytes.count)")
            callback(.done)
        } else {
            callback(.continue)
        }
    }
}
