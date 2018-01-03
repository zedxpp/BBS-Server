//
//  PostApi.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/12/2.
//

import PerfectHTTP

class PostApi: BaseApi {
    
    static func creatPost() -> RequestHandler {
        return {
            request, response in
            
//            printLog(request.params())
            
            let res = Result(data: [String: Any]())
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["title", "content", "userId", "forumId"], optionalParams: ["pics"]) {
                return
            }
            
            let post = Post()
            post.post_create_time = Int64(Tool.timeStamp) ?? 0
            post.post_title = request.param(name: "title") ?? "未能识别的标题"
            post.post_content = request.param(name: "content") ?? "未能识别的内容"
            post.post_content_pics = request.param(name: "pics") ?? ""
            post.post_create_user_id = Int64(request.param(name: "userId")!) ?? 0
            post.forum_id = Int64(request.param(name: "forumId")!) ?? 0

            do {
                try post.save()
                try response.setBody(json: res.toDict())
            } catch {
                serverErrorHandle(result: res, response: response)
                printLog(error)
            }
            
            response.completed()
        }
    }
    

    static func postList() -> RequestHandler {
        return {
            request, response in
        
            
            
            var res = Result(data: [])
            
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["forumId"]) {
                return
            }
            
            let post = Post()
            
            do {
                let forumId = request.param(name: "forumId") ?? "0"

                let id = Int(forumId)!
                
                if id > 0 {
                    try post.find(["forum_id": forumId])
                } else {
                    try post.findAll()
                }
                
                var users = [[String: [String: Any]]]()
                for tmpPost in post.rows() {
                    let user = User()
                    do {
                        try user.get(tmpPost.post_create_user_id)
                        let dict = user.objToDict()
                        users.append(["user": dict])
                    } catch {
                        printLog(error)
                    }
                }
                
                if post.rows().count != users.count {
                    users = []
                }
                
                let arr = post.rows().sorted(by: { (a, b) -> Bool in
                    a.post_create_time > b.post_create_time
                })
                
                let data = post.objToArrayDict(objArr: arr, users)
                
                res = Result(data: data)
                
                do {
                    try response.setBody(json: res.toDict())
                } catch {
                    self.serverErrorHandle(result: res, response: response)
                    printLog(error)
                }
            } catch {
                self.serverErrorHandle(result: res, response: response)
                printLog(error)
            }
            
            response.completed()
            
        }
    }
    
    static func postDetails() -> RequestHandler {
        return {
            request, response in
            
//            printLog(request.params())
//
//            printLog(request.param(name: "postId"))
            
            let res = Result(data: [String: Any]())
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["postId"]) {
                return
            }
            
//            printLog(request.param(name: "postId"))
            
            let id =  request.param(name: "postId")!
            
            let post = Post()
            
            do {
                
                try post.get(id)
                
                let user = User()
                
                do {
                    try user.get(post.post_create_user_id)
                    
                    let data = post.objToDict(["user": user.objToDict()])
                    
                    res.dataDict = data
                    
                    do {
                        try response.setBody(json: res.toDict())
                        
                    } catch {
                        self.serverErrorHandle(result: res, response: response)
                        printLog(error)
                    }
                } catch {
                    self.serverErrorHandle(result: res, response: response)
                    printLog(error)
                }
                
            } catch {
                self.serverErrorHandle(result: res, response: response)
                printLog(error)
            }
            
            response.completed()
        }
    }
    
//    allParams: ["postId", "forumId", "userId"]) {
    static func myCollectionPostList() -> RequestHandler {
        return {
            request, response in
            
            var res = Result(data: [String: Any]())
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["userId"]) {
                return
            }
            
            let pc = PostCollection()
            
            do {
                try pc.find(["user_id": request.param(name: "userId")!])
                
                var postArr = [[String: Any]]()
                for tmpPc in pc.rows() {
                    let post = Post()
                    do {
                        try post.get(tmpPc.post_id)
                        
                        if post.id > 0 {
//                            postArr.append(post)
                            postArr.append(post.objToDict())
                        }
                        
                    } catch {
                        printLog(error)
                    }
                }
                
                res = Result(data: postArr)
                
                
                
                do {
                    try response.setBody(json: res.toDict())
                } catch {
                    self.serverErrorHandle(result: res, response: response)
                    printLog(error)
                }
                
                
            } catch {
                printLog(error)
            }
            
            
            response.completed()
        }
    }
}

