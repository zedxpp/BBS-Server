//
//  UserApi.swift
//  BBS-ServerPackageDescription
//
//  Created by pengpeng on 2017/12/9.
//

import PerfectHTTP
import PerfectCrypto

class UserApi: BaseApi {
    
    static func createUser() -> RequestHandler {
        return {
            request, response in
            
            //            printLog(request.params())
            
            let res = Result(data: [String: Any]())
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["phone", "password", "nickname"]) {
                return
            }
            
            guard let phoneStr = request.param(name: "phone"), phoneStr.count == 11 else {
                res.failure(code: .parameterError, reasonStr: "手机号必须是11位")
                try! response.setBody(json: res.toDict())
                response.completed()
                return
            }
            
            let checkPhone = User()
            do {
                try checkPhone.find(["user_phone": phoneStr])
//                printLog(checkPhone.rows().count)
                
                if checkPhone.rows().count > 0 {
                    res.failure(code: .parameterError, reasonStr: "该手机号已被注册")
                    try! response.setBody(json: res.toDict())
                    response.completed()
                    return
                }
            } catch {
                printLog(error)
            }
            

            guard let passwordBase64 = request.param(name: "password") else {
                res.failure(code: .parameterError, reasonStr: "密码不能为空")
                try! response.setBody(json: res.toDict())
                response.completed()
                return
            }
            
            var password = String()
            if let base64Res = passwordBase64.decode(.base64),
                let base64UTF8 = String(validatingUTF8: base64Res) {
                password = base64UTF8
            }
//            printLog(password.count)
            if password.count < 6 || password.count > 10 {
                res.failure(code: .parameterError, reasonStr: "密码必须是6~10位")
                try! response.setBody(json: res.toDict())
                response.completed()
                return
            }
            
            guard let nickname = request.param(name: "nickname"), nickname.count > 0 && nickname.count <= 10 else {
                res.failure(code: .parameterError, reasonStr: "昵称必须是1~10位")
                try! response.setBody(json: res.toDict())
                response.completed()
                return
            }
            
            let checkNickname = User()
            do {
                try checkNickname.find(["user_nick_name": nickname])
                if checkNickname.rows().count > 0 {
                    res.failure(code: .parameterError, reasonStr: "该昵称已被使用")
                    try! response.setBody(json: res.toDict())
                    response.completed()
                    return
                }
            } catch {
                printLog(error)
            }
            
            let user = User()
            user.user_phone = phoneStr
            user.user_pass_word = passwordBase64
            user.user_nick_name = nickname
            user.user_create_time = Int64(Tool.timeStamp) ?? 0
            user.user_icon = "http://cxp.im/images/icon.jpg"
//            printLog(user)
            
            do {
                try user.save()
                try response.setBody(json: res.toDict())
            } catch {
                serverErrorHandle(result: res, response: response)
                printLog(error)
            }
            
            response.completed()
        }
    }
    
    static func getUserInfo() -> RequestHandler {
        return {
            request, response in
            
            let res = Result(data: [String: Any]())
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["userId"]) {
                return
            }
            
            let user = User()
            
            do {
                try user.get(request.param(name: "userId")!)
                
                res.dataDict = user.objToDict()
                
                try response.setBody(json: res.toDict())
            } catch {
                serverErrorHandle(result: res, response: response)
                printLog(error)
            }
            
            response.completed()
        }
    }
    
    static func loginAccount() -> RequestHandler {
        return {
            request, response in
            
            let res = Result(data: [String: Any]())
            
            if !paramsCheckUp(request: request, response: response, result: res, allParams: ["phone", "password"]) {
                return
            }
            
            guard let phoneStr = request.param(name: "phone"), phoneStr.count == 11 else {
                res.failure(code: .parameterError, reasonStr: "手机号必须是11位")
                try! response.setBody(json: res.toDict())
                response.completed()
                return
            }
            
            guard let passwordBase64 = request.param(name: "password") else {
                res.failure(code: .parameterError, reasonStr: "密码不能为空")
                try! response.setBody(json: res.toDict())
                response.completed()
                return
            }
        
            let user = User()
            
            do {
                
//                printLog(phoneStr)
//                printLog(passwordBase64)
                try user.find(["user_phone": phoneStr, "user_pass_word": passwordBase64])
                
//                printLog(user.id)
                
                if user.id < 1 {
                    res.failure(code: .parameterError, reasonStr: "用户名或密码错误")
                    try! response.setBody(json: res.toDict())
                } else {
                    res.dataDict = user.objToDict()
                }

                try response.setBody(json: res.toDict())
            } catch {
                serverErrorHandle(result: res, response: response)
                printLog(error)
            }
            
            response.completed()
        }
    }
}


//            printLog("========")
//
//            let t = "123456"
//            if let tt = t.encode(.base64),
//                let ttt = String(validatingUTF8: tt) {
//                printLog(ttt)
//            }
//            //    MTIzNDU2
//            printLog("========")
//
//            let r = "MTIzNDU2"
//            if let rr = r.decode(.base64),
//                let rrr = String(validatingUTF8: rr) {
//                printLog(rrr)
//            }
//
//            printLog("========")
