//
//  AppVerUtil.swift
//  app
//
//  Created by kk on 15/9/30.
//  Copyright © 2015年 上海酷屏信息技术有限公司. All rights reserved.
//

import UIKit

class AppVer:NSObject{
    static let sharedInstance = AppVer()
    
    ///服务器获得的最新版本号
    var ver = NSObject()
    var enforce = NSObject()
    var code = NSObject()
    
    var appVer:String{
        get{
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        }
    }
    
    var appBuild:String{
        get{
            return Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as! String
        }
    }
    
    var FullVersion: String {
        get {
            return "\(appVer)(\(appBuild))"
        }
    }
    
    var lastVersion: String? {
        get {
//            return UserDefaults.standardUserDefaults.objectForKey(AppVerUtil.versionKey) as? String
            return ""
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    private override init() {
        
    }
    
}


class AppVerUtil:NSObject {
    
    private static let versionKey = "VersionKey"
    
    private static let shouldShowUpdateInfoKey = "shouldShowUpdateInfo"
    
    private static let needUpdateFunc = "needUpdate"
    
    class func isFirstOpenAfterUpdate()->Bool{
        if AppVer.sharedInstance.lastVersion == nil{
            return true
        }
        else{
            if AppVer.sharedInstance.lastVersion != AppVer.sharedInstance.appVer{
                return true
            }
            return false
        }
    }
    
//    class func checkIfNeedUpdate()->Bool{
//        let versionNums = AppVer.sharedInstance.appVer.componentsSeparated(by: ".")
//        let latestVersionNums = AppVer.sharedInstance.ver.stringValue().componentsSeparatedByString(".")
//        if latestVersionNums.count <= versionNums.count{
//            for (index,latestNumStr) in latestVersionNums.enumerate(){
//                let latestNum = NSInteger(latestNumStr)
//                let num = NSInteger(versionNums[index])
//                if latestNum > num{
//                    return true
//                }else if latestNum < num{
//                    return false
//                }
//            }
//        }
//        if latestVersionNums.count > versionNums.count{
//            return true
//        }
//        return false
//    }
    
//    class func saveVersion(){
//        
//        UserDefaults.standard.set(AppVer.sharedInstance.appVer, forKey: versionKey)
//        
//        UserDefaults.standard.synchronize()
//    }
//    
//    class func checkShouldShowUpdateInfo()->Bool{
//        return !UserDefaults.standard.bool(forKey: shouldShowUpdateInfoKey)
//    }
//    
//    class func didShowUpdateinfo(){
//        UserDefaults.standard.set(true, forKey: shouldShowUpdateInfoKey)
//    }
//    
//    class func shouldShowUpdateInfo(){
//        UserDefaults.standard.set(false, forKey: shouldShowUpdateInfoKey)
//    }
    
    
    //将版本号转换为能处理成数字的格式
//    private static func handleString(version: String) -> String{
//        
//        var resultVersion = ""
//        
//        for index in 0 ..< version.characters.count{
//            
//            if index != (version.characters.count - 2){
//            
//                resultVersion.append(version[index])
//                
//            }
//        }
//        
//        return resultVersion
//    }
    
}
