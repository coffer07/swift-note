
//
//  BlmOpen.swift
//  app
//
//  Created by kk on 15/10/20.
//  Copyright © 2015年 上海酷屏信息技术有限公司. All rights reserved.
//

import WebKit


class BlmOpen: NSObject, WKScriptMessageHandler {
    
    var openCb: ((_ url: String) -> Void)?
    
    init(opCb: @escaping (_ url: String) -> Void) {
        
        super.init()
        
        self.openCb = opCb
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if message.name != BLMUCCHandleName.Open.rawValue {
            
            return
            
        }
        
        if let argArr = message.body as? Array<String> {
            
            if argArr.count < 1 {
                return
            }
            self.openCb?(argArr[0])
        }
    }
}
