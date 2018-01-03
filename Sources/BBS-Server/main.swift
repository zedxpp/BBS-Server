//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectCrypto


import Foundation

import PerfectMySQL
import MySQLStORM
import StORM

// MARK: - 其他初始化

func setUpMySql() {
    let serverConfig = ServerConfiguration()
    
    MySQLConnector.host        = serverConfig.mysqlHost
    MySQLConnector.username    = serverConfig.mysqlUser
    MySQLConnector.password    = serverConfig.mysqlPwd
    MySQLConnector.database    = serverConfig.mysqlDBName
    
    print("MySql初始化完成")
}

func setUpPerfectCrypto() {
    if PerfectCrypto.isInitialized {
        print("PerfectCrypto初始化成功")
    } else {
        print("PerfectCrypto初始化失败")
    }
}

// MARK: - Perfect相关初始化

func setUpRoutes() -> [Route] {
    var routeArray = [Route]()
    
    let imgFile = Route(method: .get, uri: "/images/**", handler: { (request, response) in
        //        let docRoot = request.documentRoot
        
        
        //        routes.add(method: .get, uri: "/**", handler: {
        //            request, response in
        //            StaticFileHandler(documentRoot: request.documentRoot).handleRequest(request: request, response: response)
        //        })
        
        //        routes.add(method: .get, uri: "/files/**", handler: {
        //            request, response in
        //
        
        //        }
        //        )
        // 获得符合通配符的请求路径
        request.path = request.urlVariables[routeTrailingWildcardKey] ?? String()
        
        // 用文档根目录初始化静态文件句柄
        let handler = StaticFileHandler(documentRoot: Tool.imagesPath)
        
        // 用我们的根目录和路径
        // 修改集触发请求的句柄
        handler.handleRequest(request: request, response: response)
        
    })
    routeArray.append(imgFile)
    
    routeArray.append(Route(method: .post, uri: "/uploadImages", handler: FileApi.uploadImages()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/postList", handler: PostApi.postList()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/forumList", handler: ForumApi.forumList()))
    
    
    routeArray.append(Route(method: .post, uri: "/creatPost", handler: PostApi.creatPost()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/postDetails", handler: PostApi.postDetails()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/myCollectionPostList", handler: PostApi.myCollectionPostList()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/createUser", handler: UserApi.createUser()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/getUserInfo", handler: UserApi.getUserInfo()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/loginAccount", handler: UserApi.loginAccount()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/commentList", handler: CommentApi.commentList()))
    
    routeArray.append(Route(methods: [.get, .post], uri: "/createComment", handler: CommentApi.createComment()))
    
    return routeArray
}


// MARK: - Perfect初始化

do {
    
    setUpPerfectCrypto()
    
    setUpMySql()
    

    printLog("文件存储路径: \(Dir.workingDir.path)")
 
    let requestFilters: [(HTTPRequestFilter, HTTPFilterPriority)] = [
        (Filter(), HTTPFilterPriority.high)
    ]
    
    let responseFilters: [(HTTPResponseFilter, HTTPFilterPriority)] = [
        (Filter404(), HTTPFilterPriority.high),
        (FilterResult(), HTTPFilterPriority.high)
    ]
    
    let routeArray = setUpRoutes()
    
    let serverConfig = ServerConfiguration()

    let h = HTTPServer.Server(name: serverConfig.name, port: serverConfig.httpPort, routes: Routes(routeArray), requestFilters: requestFilters, responseFilters: responseFilters)

    print("===========================================")
    
    try HTTPServer.launch([h])
    
} catch {
	fatalError("\(error)")
}



// MARK: - 代码注释

//    response.setHeader(.contentType, value: "text/html")
//    response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world! is very cool!</body></html>")
//    response.completed()



// 可以在服务器上存储静态页面 可用
//    let htmlRoute = Route(method: .get, uri: "/", handler: { (request, response) in
//        request.path = "index.html"
////        /index.html
//
//        // 用文档根目录初始化静态文件句柄
//        let handler = StaticFileHandler(documentRoot: "/Users/pengpeng/Desktop")
//
//        // 用我们的根目录和路径
//        // 修改集触发请求的句柄
//        handler.handleRequest(request: request, response: response)
//    })

//    http.addRoutes(Routes([postListRoute]))
//    try http.start()

//    [postListRoute, forumListRoute, imgFile, uploadFile, crectePostRoute, createUserRoute, getUserInfoRoute]


//public extension HTTPHandler {
//    public static func staticFiles(data: [String:Any]) throws -> RequestHandler {
//        let documentRoot = data["documentRoot"] as? String ?? "./webroot"
//        let allowResponseFilters = data["allowResponseFilters"] as? Bool ?? false
//        return {
//            req, resp in
//            StaticFileHandler(documentRoot: documentRoot, allowResponseFilters: allowResponseFilters)
//                .handleRequest(request: req, response: resp)
//        }
//    }
//}

//func startMySQL() -> Bool {
//    let mysql = MySQL() // 创建一个MySQL连接实例
//    let connected = mysql.connect(host: MySQLHost, user: MySQLUser, password: MySQLPassword, db: MySQLDB)
//
//    guard connected else {
//        // 验证一下连接是否成功
//        print(mysql.errorMessage())
//
//    }
//
//    let resList = mysql.listDatabases()
//    //    resList.contains("bbs")
//
//    //    print("\(mysql.listDatabases())")
//    //    print("\n")
//
//    //    let querySuccess = mysql.query(statement: "SELECT * from post")
//    //    print(querySuccess)
//
//    defer {
//        mysql.close() //这个延后操作能够保证在程序结束时无论什么结果都会自动关闭数据库连接
//    }
//}

//printLog(getTimeStamp())
//let f = Forum()
//f.forum_create_time = Int64(getTimeStamp())
//f.forum_name = "吹水区2"
//do {
//    try f.save()
//    try f.findAll()
//    printLog(f.objToArrayDict(objArr: f.rows()))
//    try f.get(1)
//    print(f.objToDict())
//    printLog("保存成功")
//} catch {
//    printLog("保存异常")
//}



//postList()

//func handler() throws -> RequestHandler {
//    return {
//        request, response in
//        // Respond with a simple message.
//        response.setHeader(.contentType, value: "text/html")
//        response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world! is very cool!</body></html>")
//        // Ensure that response.completed() is called when your processing is done.
//        response.completed()
//    }
//}


//let confData = [
//    "servers": [
//        [
//            "routes":[
//                ["method":"get", "uri":"/", "handler": ""],
////                除了“methods”是一个字符串数组之外，其他每个条目对应的取值都是一个字符串。如果不设置method条目，则默认所有方法都适用与该URI的配套处理器。
//                ["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles,
//                 "documentRoot":"./webroot",
////                 staticFiles 静态文件处理器需要一个“documentRoot”文档根目录的变量，用于配制服务器本地静态页面文件存储的目录。
//                 "allowResponseFilters":true],
//                [
//                    "methods":["get", "post"],
//                    "uri":"/api/**",
//                    "handler":"PerfectHTTPServer.HTTPHandler.redirect",
//                    "base":"http://other.server.ca"
//                ]
//            ],
//            "filters":[
//                [
//                "type":"response",
//                "priority":"high",
//                "name":PerfectHTTPServer.HTTPFilter.contentCompression,
//                ]
//            ]
//        ]
//    ]
//]



////// 验证属性值是否一致
////XCTAssert(user.firstName == user2.firstName)
////XCTAssert(user.lastName == user2.lastName)
////XCTAssert(user.age == user2.age)
//

//
//    //    public func listTables(wildcard wild: String? = nil) -> [String]
//
//    //    print(mysql.listTables())
//    //
//    //    if let table = mysql.listDatabases().last {
//    ////        print(mysql.listTables(wildcard: table))
//    ////        print(mysql.listTables(wildcard: table))
//    //    }
//

//    //    let str = "INSERT INTO user (\"id\", \"name\") VALUES (1, \"code add\")"
//    //    let str = "INSERT INTO user (id, name) VALUES (4, code)"
//    //
//    //    print(str)
//    //
//    //    let sql = MySQLStmt(mysql)
//    //
//    //    print(sql.prepare(statement: str))
//
//    //    if sql.prepare(statement: str) == true {
//    //
//    //        print("插入结果 %d", sql.execute())
//    //
//    //    }
//
//
//
//    //    let createSQLStr = "CREATE TABLE IF NOT EXISTS test(id INT UNSIGNED AUTO_INCREMENT, title VARCHAR(100) NOT NULL, date DATE, PRIMARY KEY (id)) DEFAULT CHARSET=utf8"
//    //    let createSQLStr = "CREATE TABLE IF NOT EXISTS testxxx(id INT UNSIGNED AUTO_INCREMENT, title VARCHAR(100) NOT NULL, PRIMARY KEY (id)) DEFAULT CHARSET=utf8"
//    //    let insertSqlStr = "INSERT INTO user (name) VALUES ('aaa')"
//    //
//    //    let stmt = MySQLStmt(mysql)
//    //    print(stmt.prepare(statement: insertSqlStr))
//    //    if stmt.prepare(statement: insertSqlStr) == true {
//    //        print(stmt.execute())
//    //    }
//
//    //    SELECT a.statusId,a.name,b.id,b.content FROM user a, status b WHERE a.statusId=b.id
//
//    // 运行查询（比如返回在options数据表中的所有数据行）
//    let querySuccess = mysql.query(statement: "SELECT * from user")
//    //    let querySuccess = mysql.query(statement: "SELECT id, name, statusId from user")
//    //    let querySuccess = mysql.query(statement: "select COLUMN_NAME from information_schema.COLUMNS where table_name = 'user' and table_schema = 'testdata'")
//


////// 将路由注册到服务器上
////server.addRoutes(routes)
////server.addRoutes(routes2)
//
////var routes = Routes()
////// 为程序接口API版本v1创建路由表
////var api = Routes()
////api.add(method: .get, uri: "/call1", handler: { _, response in
////    response.setBody(string: "程序接口API版本v1已经调用")
////    response.completed()
////})
////api.add(method: .get, uri: "/call2", handler: { _, response in
////    response.setBody(string: "程序接口API版本v2已经调用")
////    response.completed()
////})
////
////// API版本v1
////var api1Routes = Routes(baseUri: "/v1")
////// API版本v2
////var api2Routes = Routes(baseUri: "/v2")
////
////// 为API版本v1增加主调函数
////api1Routes.add(api)
////// 为API版本v2增加主调函数
////api2Routes.add(api)
////// 更新API版本v2主调函数
////api2Routes.add(method: .get, uri: "/call2", handler: { _, response in
////    response.setBody(string: "程序接口API版本v2已经调用第二种方法")
////    response.completed()
////})
////
////// 将两个版本的内容都注册到服务器主路由表上
////routes.add(api1Routes)
////routes.add(api2Routes)
////
////
////// 监听8181端口
////server.serverPort = 8181
////server.addRoutes(routes)
////
////do {
////    // 启动HTTP服务器
////    try server.start()
////} catch PerfectError.networkError(let err, let msg) {
////    print("网络出现错误：\(err) \(msg)")
////}
//
//
//
//
//
////// An example request handler.
////// This 'handler' function can be referenced directly in the configuration below.
////func handler(data: [String:Any]) throws -> RequestHandler {
////    return {
////        request, response in
////        // Respond with a simple message.
////        //        response.setHeader(.contentType, value: "text/html")
////        //        response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!Perfect</body></html>")
////
////        //        response.status = .movedPermanently
////        //        response.setHeader(.location, value: "http://www.perfect.org/")

////        //        let docRoot = request.documentRoot
////        //        do {
////        ////            let mrPebbles = File("\(docRoot)/git.jpg")
////        //            let mrPebbles = File("/Users/changxianpeng/Desktop/git.jpg")
////        //            let imageSize = mrPebbles.size
////        //            let imageBytes = try mrPebbles.readSomeBytes(count: imageSize)
////        //            response.setHeader(.contentType, value: MimeType.forExtension("jpg"))
////        //            response.setHeader(.contentLength, value: "\(imageBytes.count)")
////        //            response.setBody(bytes: imageBytes)
////        //        } catch {
////        //            response.status = .internalServerError
////        //            response.setBody(string: "请求处理出现错误： \(error)")
////        //        }
////
////
////        // Ensure that response.completed() is called when your processing is done.
////        response.completed()
////
////
////    }
////}

//
//        //        do {
//        ////            try obj.select(
//        ////                whereclause: "firstname = ?",
//        ////                params: [""],
//        ////                orderby: ["id"]
//        ////            )
//        //
//        ////            let cursor = StORMCursor(limit: 0, offset: 0, totalRecords: 1)
//        ////            try obj.select(
//        ////                columns: [],
//        ////                whereclause: "1",
//        ////                params: [],
//        ////                orderby: [],
//        ////                cursor: cursor
//        ////            )
//        //
//        ////            try obj.findAll()
//        //
//        ////            try obj.select(columns: ["id"], whereclause: "firstname = ?", params: ["Joe"], orderby: ["id DESC"])
//        //
//        //            try obj.delete(1)
//        //
//        //        } catch  {
//        //            print("错误 \(error)")
//        //        }
//
//        //        print(obj.rows())
//        //        print("\(obj.id)\(obj.firstname)\(obj.lastname)\(obj.email)")
//        //        for xx in obj.rows() {
//        //            print("\(xx.id)  \(xx.firstname)  \(xx.lastname)  \(xx.email)")
//        //        }
//
//        //
//        //        do {
//        //            try obj.find([("firstname", "Joe3")])
//        //        } catch {
//        //
//        //        }
//        //        print("找到记录：  \(obj.id), \(obj.firstname), \(obj.lastname)")
//
//


//        //            try obj.create()
//        //

//
//
//
////        do {
////            try response.setBody(json: res)
////        } catch {
////
////        }
//
//        // 调用数据库
//        //        fetchData()
//
//                response.setHeader(.contentType, value: "text/html")
//                response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!Perfect</body></html>")
//
//        //        response.status = .movedPermanently
//        //        response.setHeader(.location, value: "http://www.perfect.org/")
//
//
//        //        let docRoot = request.documentRoot
//        //        do {
//        ////            let mrPebbles = File("\(docRoot)/mr_pebbles.jpg")
//        //            let mrPebbles = File("/Users/changxianpeng/Desktop/PerfectTemplate/111.png")
//        //            let imageSize = mrPebbles.size
//        //            let imageBytes = try mrPebbles.readSomeBytes(count: imageSize)
//        //            response.setHeader(.contentType, value: MimeType.forExtension("jpg"))
//        //            response.setHeader(.contentLength, value: "\(imageBytes.count)")
//        //            response.setBody(bytes: imageBytes)
//        //        } catch {
//        //            response.status = .internalServerError
//        //            response.setBody(string: "请求处理出现错误： \(error)")
//        //        }
//
//        //        for (cookieName, cookieValue) in request.cookies {
//        //            print("cookieName = \(cookieName) | cookieValue = \(cookieValue)")
//        //        }
//        //
//        //        let cookie = HTTPCookie(name: "myblog", value: "", domain: nil,
//        //                                expires: .session, path: "/",
//        //                                secure: false, httpOnly: false)
//        //        response.addCookie(cookie)
//
//        response.completed()
//    }
//}
//

//
//
//do {
//    try HTTPServer.launch(configurationData: config)
//    //    var routes = Routes()
//    //    routes.add(method: .get, uri: "/path/one", handler: { request, response in
//    //        response.setBody(string: "路由句柄已经收到")
//    //        response.completed()
//    //    })
//    //    server.addRoutes(routes)
//} catch {
//    //    fatalError("\(error)")
//}
//
//
//
//
//
///*
// import PostgresStORM
//
// class User: PostgresStORM {
// // NOTE: 注意，第一个属性将会是数据表主索引。
// var id              : Int = 0
// var firstname       : String = ""
// var lastname        : String = ""
// var email           : String = ""
//
//
// override open func table() -> String {
// return "users"
// }
//
// override func to(_ this: StORMRow) {
// id              = this.data["id"] as! Int
// firstname       = this.data["firstname"] as! String
// lastname        = this.data["lastname"] as! String
// email           = this.data["email"] as! String
// }
//
// func rows() -> [User] {
// var rows = [User]()
// for i in 0..<self.results.rows.count {
// let row = User()
// row.to(self.results.rows[i])
// rows.append(row)
// }
// return rows
// }
// }
// */
//
//

