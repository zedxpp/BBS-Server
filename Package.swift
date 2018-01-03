// Generated automatically by Perfect Assistant Application
// Date: 2017-09-20 19:30:47 +0000
import PackageDescription
//let package = Package(
//    name: "BBS-Server",
//    targets: [],
//    dependencies: [
//        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 3),
//        .Package(url:"https://github.com/PerfectlySoft/Perfect-MySQL.git", majorVersion: 3),
//        .Package(url: "https://github.com/SwiftORM/MySQL-StORM", majorVersion: 3),
//    ]
//)

let versions = Version(0,0,0)..<Version(10,0,0)
let urls = [
    "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
    "https://github.com/PerfectlySoft/Perfect-MySQL.git",
    "https://github.com/SwiftORM/MySQL-StORM.git"
]

let package = Package(
    name: "BBS-Server",
    targets: [],
    dependencies: urls.map { .Package(url: $0, versions: versions) }
)

