//
//  Result.swift
//  BBS-ServerPackageDescription
//
//  Created by peng on 2017/11/20.
//



import MySQLStORM

enum ResultCode: Int {
    case success = 200
    
    // 入参错误
    case parameterError = 410
    // 入参不能为空
    case parameterNil = 411
    
    // 接口不存在
    case apiNonExistent = 420
    // 登录信息失效
    case loginInvalid = 450
    
    // 请求失败 其他情况
    case failure = 499
    
    // 服务器内部错误
    case serverError = 500
}

class Result: MySQLStORM {
    
    var code = 200
    var codeMsg = "请求成功"
    var dataArr: [Any]?
    var dataDict: [String: Any]?
    
    private init(codeStatus: Int, codeMessage: String) {
        code = codeStatus
        codeMsg = codeMessage
    }
    
    convenience init(codeStatus: Int, codeMessage: String, data: [Any]) {
        self.init(codeStatus: codeStatus, codeMessage: codeMessage)
        dataArr = data
    }
    
    convenience init(codeStatus: Int, codeMessage: String, data: [String: Any]) {
        self.init(codeStatus: codeStatus, codeMessage: codeMessage)
        dataDict = data
    }
    
    init(data: [Any]) {
        dataArr = data
    }
    
    init(data: [String: Any]) {
        dataDict = data
    }
    
    
//    func failure(code: ResultCode, reasonStr: String = "") -> Result {
    func failure(code: ResultCode, reasonStr: String = "") {
        var str = ""
        
        if reasonStr.isEmpty {
            switch code {
            case .success:
                str = "请求成功"
            case .parameterError:
                str = "入参传入错误"
            case .parameterNil:
                str = "入参不能为空"
            case .apiNonExistent:
                str = "接口不存在"
            case .loginInvalid:
                str = "登录信息失效"
            case .serverError:
                str = "服务器内部错误"
            default:
                str = "请求失败"
            }
        } else {
            str = reasonStr
        }
        
//        return
        failureHandle(codeStatus: code.rawValue, codeMessage: str)
    }
        
//    private func failureHandle(codeStatus: Int, codeMessage: String) -> Result {
    private func failureHandle(codeStatus: Int, codeMessage: String) {
        code = codeStatus
        codeMsg = codeMessage
        dataArr = []
        dataDict = nil
//        return self
    }
    
    
    func toDict() -> [String: Any] {
        var resDict = [String: Any]()
        
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
//            print("\(label) = \(value)")
            
            if label.isEmpty {
                continue
            } else {
                
                if label == "dataArr" {
                    if dataArr == nil {
                        continue
                    }

                    resDict["data"] = value
                } else if label == "dataDict" {
                    
                    if dataDict == nil {
                        continue
                    }
                    
                    resDict["data"] = value
                } else {
                    resDict[label] = value
                }
            }
        }
        return resDict
    }
    
}

//enum ResultStatus: String {
//    // 成功
//    case Success = "请求成功"
//    // 失败
////    case Failure = "请求失败"
//    // 参数错误
//    case ParameterError = "请求参数异常"
//    // 服务器内部错误
//    case ServerError = "服务器内部发生错误"
//    // 接口不存在
//    case ApiNonExistent = "接口不存在"
//    // 登录信息失效
//    case LoginInvalid = "登录信息失效"
//}



//HTTP 状态返回代码 4xx（请求错误）这些状态代码表示请求可能出错，妨碍了服务器的处理。
//
//HTTP 状态返回代码 5xx（服务器错误）这些状态代码表示服务器在尝试处理请求时发生内部错误。
//400    （错误请求）服务器不理解请求的语法。
//401    （未授权）请求要求身份验证。对于需要token的接口，服务器可能返回此响应。
//403    （禁止）服务器拒绝请求。对于群组/聊天室服务，表示本次调用不符合群组/聊天室操作的正确逻辑，例如调用添加成员接口，添加已经在群组里的用户，或者移除聊天室中不存在的成员等操作。
//404    （未找到）服务器找不到请求的接口。
//408    （请求超时）服务器等候请求时发生超时。
//413    （请求体过大）请求体超过了5kb，拆成更小的请求体重试即可。
//429    （服务不可用）请求接口超过调用频率限制，即接口被限流。
//500    （服务器内部错误）服务器遇到错误，无法完成请求。
//501    （尚未实施）服务器不具备完成请求的功能。例如，服务器无法识别请求方法时可能会返回此代码。
//502    （错误网关）服务器作为网关或代理，从上游服务器收到无效响应。
//503    （服务不可用）请求接口超过调用频率限制，即接口被限流。
//504    （网关超时）服务器作为网关或代理，但是没有及时从上游服务器收到请求。
