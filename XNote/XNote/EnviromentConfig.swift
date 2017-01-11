//
//  EnviromentConfig.swift
//  XNote
//
//  Created by 高翔 on 2017/1/4.
//  Copyright © 2017年 高翔. All rights reserved.
//

import Foundation

#if DEBUG

    let serverHost:ServerHost = ServerHost.Develop;
    
#else

    let serverHost:ServerHost = ServerHost.Offical;

#endif


public func debugLog(_ item: Any) {
    #if DEBUG
        print(item)
    #else
        
    #endif
}

