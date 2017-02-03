//
//  Mediator+Actions.swift
//  XNote
//
//  Created by 高翔 on 2017/2/3.
//  Copyright © 2017年 高翔. All rights reserved.
//

// MARK: - WebViewControll 类名 这个类名前面部分是动态的，需要根据文件所在工程，写上当前工程
let kMediatorBlmUCC = "XNote.BlmUCC"

import Foundation

extension Mediator {
    
    // MARK: - webViewControll 组建
    // 加载js 需要在appdelegate 内执行
    func loadScript() {
        _ = self.performTarger(targetName: kMediatorBlmUCC, actionName: "loadScript", params: nil, shouldCacheTarget: false, isClassMethod: true)
    }
    
}

