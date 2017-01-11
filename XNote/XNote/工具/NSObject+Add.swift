//
//  NSObject+Add.swift
//  XNote
//
//  Created by 高翔 on 2017/1/12.
//  Copyright © 2017年 高翔. All rights reserved.
//

import Foundation

extension NSObject {
    
    public func getNameDescription() -> String {
        let startIndex = self.description.range(of: ".")
        let endIndex = self.description.range(of: ":")

        if startIndex == nil || endIndex == nil || startIndex!.lowerBound > endIndex!.lowerBound{
            return self.description
        }
        return self.description.substring(with: startIndex!.upperBound..<endIndex!.lowerBound)
    }
}
