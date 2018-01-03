//
//  FileApi.swift
//  BBS-ServerPackageDescription
//
//  Created by pengpeng on 2017/12/4.
//

import PerfectHTTP
import PerfectLib

class FileApi: BaseApi {
    
    static func uploadImages() -> RequestHandler {
        return {
            request, response in
            
            let res = Result(data: [])
            
            guard let uploads = request.postFileUploads, !uploads.isEmpty else {
                res.failure(code: .parameterError, reasonStr: "未找到需要上传的文件")
                try! response.setBody(json: res.toDict())
                response.completed()
                return
            }
            
            // 通过操作fileUploads数组来掌握文件上传的情况
            // 如果这个POST请求不是分段multi-part类型，则该数组内容为空
            //        print(request.postFileUploads!)
            
            //        var values = [String:Any]()
            
            // 创建一个字典数组用于检查已经上载的内容
            //            var ary = [[String:Any]]()
            
            var fileNameArr = [String]()
            
            var rootPath = Tool.imagesPath
            
            rootPath += "\(Tool.date)/"
            
            // 接口放到服务器后, 文件夹不存在的情况需要处理
            
            let dir = Dir(rootPath)
            if !dir.exists {
                do {
                    printLog("服务器目标文件夹不存在, 创建成功")
                    try Dir(rootPath).create()
                } catch {
                    printLog("服务器目标文件夹不存在, 创建失败")
                    printLog(error)
                }
            }
            
            for upload in uploads {
                
                //                ary.append([
                //                    "fieldName": upload.fieldName,  //字段名
                //                    "contentType": upload.contentType, //文件内容类型
                //                    "fileName": upload.fileName,    //文件名
                //                    "fileSize": upload.fileSize,    //文件尺寸
                //                    "tmpFileName": upload.tmpFileName   //上载后的临时文件名
                //                    ])
                
                // 将文件转移走，如果目标位置已经有同名文件则进行覆盖操作。
                let thisFile = File(upload.tmpFileName)
                do {
                    let file = try thisFile.moveTo(path: rootPath + upload.fileName, overWrite: true)
//                    print(file.path)
                    //                    fieldName
//                    fileNameArr[upload.fieldName] = file.path
                    
                    
                    var base = ServerConfiguration().baseURL
                    
                    base.insert(contentsOf:":\(ServerConfiguration().httpPort)", at: base.index(before: base.endIndex))
                    
                    let url = file.path.stringByReplacing(string: Tool.rootPath, withString: base)
                    
                    fileNameArr.append(url)
                } catch {
                    print(error)
                }
            }
            //            values["files"] = ary
            //            values["count"] = ary.count
            
            //        print(values)
            
            do {
                //            try response.setBody(json: values)
                try response.setBody(json: Result(data: fileNameArr).toDict())
            } catch {
                res.failure(code: .serverError)
                try! response.setBody(json: res.toDict())
                print(error)
            }
            
            response.completed()
        }
    }
}
