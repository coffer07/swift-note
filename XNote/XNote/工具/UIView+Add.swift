//
//  UIView+Add.swift
//  XNote
//
//  Created by 高翔 on 2017/1/16.
//  Copyright © 2017年 高翔. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - UIView 画线
    func drawLine(frame: CGRect,color: CGColor) -> CALayer{
        let lineLayer = CALayer()
        lineLayer.backgroundColor = color
        lineLayer.frame = frame
        self.layer.addSublayer(lineLayer)
        return lineLayer
    }
    
    // MARK: - 切圆角
    func setCornerView(style:UIRectCorner,radius: CGFloat){
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: style, cornerRadii: CGSize(width: radius, height: radius))
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        layer.path = maskPath.cgPath
        self.layer.mask = layer
        self.layer.masksToBounds = true
    }
    
}
