//
//  BlmUCC.swift
//  app
//
//  Created by kk on 15/10/20.
//  Copyright © 2015年 上海酷屏信息技术有限公司. All rights reserved.
//

import WebKit

enum BLMUCCHandleName:String{
    case Open = "open"
    case GetVersion = "getVersion"
}

class BlmUCC: WKUserContentController {
    
    private static var script: WKUserScript?
    
    var openHdl: WKScriptMessageHandler? {
        didSet {
            self.removeScriptMessageHandler(forName: BLMUCCHandleName.Open.rawValue)
            self.add(openHdl!, name: BLMUCCHandleName.Open.rawValue)
        }
    }
    
    var getVersionHdl: WKScriptMessageHandler?{
        didSet{
            self.removeScriptMessageHandler(forName: BLMUCCHandleName.GetVersion.rawValue)
            self.add(getVersionHdl!, name: BLMUCCHandleName.GetVersion.rawValue)
        }
    }
    
    override init() {
        super.init()
        if let sc = BlmUCC.script {
            self.addUserScript(sc)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 加载JS
    class func loadScript() {
        let jsFilePath = Bundle.main.path(forResource: "bridge", ofType: "js")
        if let path = jsFilePath {
            do {
                let scriptContent = try String(contentsOfFile: path)
                BlmUCC.script = WKUserScript(source: scriptContent, injectionTime: .atDocumentStart, forMainFrameOnly: true)
            }
            catch _ as NSError {
                
            }
        }
    }
    
    func scriptfunc() {
        
    }
    
}
