//
//  ForumApi.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/11/22.
//

import PerfectHTTP

class ForumApi: BaseApi {
    
    static func forumList() -> RequestHandler {
        return {
            request, response in
            
//            printLog(request.params())
            
            let forum = Forum()
            
            var res = Result(data: [])
            
            do {
                try forum.findAll()
                
                let data = forum.objToArrayDict(objArr: forum.rows())
                
                res = Result(data: data)
                
                do {
                    try response.setBody(json: res.toDict())
                } catch {
                    self.serverErrorHandle(result: res, response: response)
                    print(error)
                }
            } catch {
                self.serverErrorHandle(result: res, response: response)
                printLog(error)
            }
            
            response.completed()
        }
    }
    

}
