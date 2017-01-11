//
//  ScreenUtil.swift
//  app
//
//  Created by kk on 15/9/18.
//  Copyright © 2015年 上海酷屏信息技术有限公司. All rights reserved.
//

import UIKit

struct ScreenUtil {
    
    private static var scrWidth: CGFloat = 0
    private static var scrHeight: CGFloat = 0
    private static var statusBarHeight: CGFloat = 0
    
    private static var mainScreen = UIScreen.main
    static var navBarHeight:CGFloat = 44
    
    static var keyWindow: UIWindow? {
        
        get {
            
            return UIApplication.shared.keyWindow
            
        }
        
    }
    
    static var statusHeight: CGFloat {
        
        get {
            
            if statusBarHeight == 0 {
                
                statusBarHeight = UIApplication.shared.statusBarFrame.height
            }

            return statusBarHeight
            
        }
        
    }
    
    static var width: CGFloat {
        
        get {
            
            if scrWidth == 0 {
                
                scrWidth = mainScreen.bounds.width
                
            }
                
            return scrWidth
            
        }
        
    }
    
    static var height: CGFloat {
        
        get {
            
            if scrHeight == 0 {
                
                scrHeight = mainScreen.bounds.height
                
            }
            
            return scrHeight
            
        }
        
    }
    
    static var navTotalHeight:CGFloat{
        get{
            return ScreenUtil.navBarHeight + ScreenUtil.statusHeight
        }
    }
    
    ///除去navbar的有效高度
    static var validHeight:CGFloat{
        get{
            return ScreenUtil.height - ScreenUtil.navTotalHeight
        }
    }
}
