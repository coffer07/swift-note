//
//  Mediator.swift
//  XNote
//
//  Created by 高翔 on 17/1/24.
//  Copyright © 2017年 高翔. All rights reserved.
//

import Foundation

class Mediator: NSObject {
    
    static var sharedInstance = Mediator()
    
    private override init() {
        super.init()
    }
    
    func performTarger(targetName: String,actionName: String,params: [String: AnyObject]?,shouldCacheTarget: Bool,isClassMethod: Bool) -> AnyObject?{
        
        if let targetClass: NSObject.Type = NSClassFromString(targetName) as? NSObject.Type{
            let targetObject = targetClass.init()
            let action = NSSelectorFromString(actionName)
            if targetObject.responds(to: action) {
                if params != nil {
                    return targetObject.perform(action, with: params!) as AnyObject?
                }
                else {
                    return targetObject.perform(action) as AnyObject?
                }
            }
            
        }
        
        return nil
        
    }
}
