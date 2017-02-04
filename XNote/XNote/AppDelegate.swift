//
//  AppDelegate.swift
//  XNote
//
//  Created by 高翔 on 2016/12/8.
//  Copyright © 2016年 高翔. All rights reserved.
//

typealias _VIMP = @convention(c)(_ id:AnyObject,_ sel:UnsafeMutablePointer<Selector>,[String: Any])->AnyObject

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //加载bridge js文件
        Mediator.sharedInstance.loadScript()
//        debugLog(NSStringFromSelector( #selector(CWkWVCtrl.init(params:))) + "/")
        allMethods()
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let webVC = Mediator.sharedInstance.webViewControllInit(params: ["url": "www.baidu.com"]) {
            window?.rootViewController = webVC
            window?.makeKeyAndVisible()
        }
        
        return true
    }
    
    func allMethods() {
       
        if  CWkWVCtrl.instancesRespond(to:  #selector(CWkWVCtrl.init(params:))) {
            
            let imp = UIViewController.instanceMethod(for: #selector(CWkWVCtrl.init(params:)))

            let paramsVIMP: _VIMP = unsafeBitCast(imp, to: _VIMP.self)
            let selectorPtr = UnsafeMutablePointer<Selector>.allocate(capacity: 1)
            selectorPtr.initialize(to: #selector(CWkWVCtrl.init(params:)))
            
            let a = paramsVIMP(CWkWVCtrl.self,selectorPtr,["url":"www.baidu.com"])
        }
        
//        var count: UInt32 = 0
//        let methods = class_copyMethodList(CWkWVCtrl.self, &count)
//        var i = 0
//        let action = NSSelectorFromString("openNewWindowWithUrl")
//        while  i < Int(count) {
//            let method = methods?[i]
//            let sel = method_getName(method)
//            if action == sel {
//                if CWkWVCtrl.self.responds(to: sel) {
//                    print("success")
//                    
//                }
//            }
//            let methodName = sel_getName(sel)
//            let argument = method_getNumberOfArguments(method)
//            i = i + 1
//            print("name: \(String.init(cString: methodName!)), arguemtns: \(argument)")
//        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

