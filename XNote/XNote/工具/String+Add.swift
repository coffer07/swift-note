//
//  String+Add.swift
//  XNote
//
//  Created by 高翔 on 2017/1/16.
//  Copyright © 2017年 高翔. All rights reserved.
//

import Foundation
import SwiftyJSON

extension String {
    
    // MARK: - string 转 json
    func jsonObject() -> JSON {
        return JSON(parseJSON: self)
    }
}
