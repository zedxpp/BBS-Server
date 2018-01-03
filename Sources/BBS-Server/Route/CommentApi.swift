//
//  CommentApi.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/12/21.
//

import PerfectHTTP

class CommentApi: BaseApi {
    static func commentList() -> RequestHandler {
        return {
            request, response in
            
//            let start = Int(Tool.date)!
            
            var res = Result(data: [String: Any]())
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["postId"]) {
                return
            }
            
            let id = request.param(name: "postId")!
            
            let comment = Comment()
            
            do {
                
                try comment.find(["comment_post_id": id])
                
//                printLog(comment.rows())
                
                var elements = [[String: Any]]()
                for tmpComment in comment.rows() {
                    
                    var dictM = [String: Any]()
                    
                    if tmpComment.comment_user_id > 0 {
                        let user = User()
                        
                        do {
                            try user.get(tmpComment.comment_user_id)
                            
                            dictM["user"] = user.objToDict()
                        } catch {
                            printLog(error)
                        }
                    }
                    
                    if tmpComment.comment_quote_id > 0 {
                        
                        let quoteComment = Comment()
                        
                        do {
                            try quoteComment.get(tmpComment.comment_quote_id)
                            
                            if quoteComment.comment_user_id > 0 {
                                let user = User()
                                
                                do {
                                    try user.get(tmpComment.comment_user_id)
                                    
                                    dictM["quoteComment"] = quoteComment.objToDict(["user": user.objToDict()])
                                } catch {
                                    printLog(error)
                                }
                            } else {
                                dictM["quoteComment"] = quoteComment.objToDict()
                            }
                        } catch {
                            printLog(error)
                        }
                    }
                    
                    elements.append(dictM)
                }
                
                let data = comment.objToArrayDict(objArr: comment.rows(), elements)
                
                res = Result(data: data)
                
//                printLog(res.toDict())
                
                do {
                    try response.setBody(json: res.toDict())
                    
//                    let end = Int(Tool.date)!
                    
//                    printLog("\((end - start))")
                    
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
    
    static func createComment() -> RequestHandler {
        return {
            request, response in
            
            let res = Result(data: [String: Any]())
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["content", "userId", "postId"], optionalParams: ["quoteId"]) {
                return
            }
            
            let comment = Comment()
            comment.comment_content = request.param(name: "content")!;
            comment.comment_user_id = Int64(request.param(name: "userId")!)!;
            comment.comment_post_id = Int64(request.param(name: "postId")!)!;
            
            if let quoteId = request.param(name: "quoteId") {
                let tC = Comment()
                tC.id = Int(quoteId) ?? 0
                
                do {
                    try tC.findAll()
                    
                    comment.comment_quote_id = Int64(quoteId)!;
                } catch {
                    printLog(error)
                }
            }
            
            let tmpComment = Comment()
            
            var floor: Int64 = 1
            
            do {
                try tmpComment.find(["comment_post_id": request.param(name: "postId")!])
                
                if !tmpComment.rows().isEmpty {
                    for c in tmpComment.rows() {
                        if c.comment_floor > floor {
                            floor = c.comment_floor
                        }
                    }
                }
                
            } catch {
                printLog(error)
            }
            
            floor += 1
            
            comment.comment_floor = floor
            comment.comment_create_time = Int64(Tool.timeStamp) ?? 0
            
            do {
                try comment.save()
                try response.setBody(json: res.toDict())
            } catch {
                serverErrorHandle(result: res, response: response)
                printLog(error)
            }
            response.completed()
        }
    }
}
