//
//  BlmVersion.swift
//  app
//
//  Created by Lee on 16/3/1.
//  Copyright © 2016年 上海酷屏信息技术有限公司. All rights reserved.
//

import WebKit

class BlmVersion: NSObject, WKScriptMessageHandler {
    
    var getVersionCb: ((_ cbName: String, _ version: String) -> Void)?

    init(getVersionCb: @escaping (_ cbName: String, _ version: String) -> Void) {
        super.init()
        self.getVersionCb = getVersionCb
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name != BLMUCCHandleName.GetVersion.rawValue {
            return
        }
        
        if let argArr = message.body as? Array<String> {
            if argArr.count < 1 {
                return
            }
            self.getVersionCb?(argArr[0], AppVer.sharedInstance.appVer)
        }
    }

}
