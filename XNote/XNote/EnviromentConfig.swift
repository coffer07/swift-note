//
//  EnviromentConfig.swift
//  XNote
//
//  Created by 高翔 on 2017/1/4.
//  Copyright © 2017年 高翔. All rights reserved.
//

import Foundation

#if RELEASE

    let serverHost:ServerHost = ServerHost.Offical;
    
#else

    let serverHost:ServerHost = ServerHost.Develop;

#endif
