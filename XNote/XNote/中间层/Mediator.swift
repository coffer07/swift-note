//
//  Mediator.swift
//  XNote
//
//  Created by 高翔 on 17/1/24.
//  Copyright © 2017年 高翔. All rights reserved.
//

import Foundation

enum MediatorErrorCode: NSInteger{
    case Success = 0
    case NotFoundClass = 1
    case NotFoundMethod = 2
}

class Mediator: NSObject {
    
    static var sharedInstance = Mediator()
    private var cachedTarget = [String: NSObject.Type]()
    private override init() {
        super.init()
    }
    
    func performTarger(targetName: String,actionName: String,params: [String: Any]?,shouldCacheTarget: Bool,isClassMethod: Bool) -> (MediatorErrorCode , AnyObject?) {

        var targetClass = self.cachedTarget[targetName]
        if targetClass == nil {
            if let targetAndClass = NSClassFromString(targetName) as? NSObject.Type {
                targetClass = targetAndClass
            }
            else {
                return (.NotFoundClass,nil)
            }
        }
        if shouldCacheTarget == true {
            self.cachedTarget[targetName] = targetClass!
        }
        let action = NSSelectorFromString(actionName)
        if isClassMethod == true {
            if targetClass!.responds(to: action) {
                if params != nil {
                    return (.Success , targetClass!.perform(action, with: params) as AnyObject?)
                }
                else {
                    return (.Success , targetClass!.perform(action) as AnyObject?)
                }
            }
         
        }
        else {
            let targetObject = targetClass!.init()
            if targetObject.responds(to: action) {
                if params != nil {
                    return (.Success , targetObject.perform(action, with: params!) as AnyObject?)
                }
                else {
                    return (.Success , targetObject.perform(action) as AnyObject?)
                }
            }
        }
        return (.NotFoundMethod , nil)
    }
    
    func releaseCachedTarget(targetName: String){
        self.cachedTarget.removeValue(forKey: targetName)
    }
}
