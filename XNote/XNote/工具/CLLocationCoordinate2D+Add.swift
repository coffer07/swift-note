//
//  CLLocationCoordinate2D+Add.swift
//  XNote
//
//  Created by 高翔 on 2017/1/16.
//  Copyright © 2017年 高翔. All rights reserved.
//

import MapKit

extension CLLocationCoordinate2D{
    
    // MARK: - 百度坐标转换GCJ-02  google,高德
    func baiduCoordinateFrome() -> CLLocationCoordinate2D{
        let x_pi = M_PI * 3000.0 / 180.0
        let x = self.longitude - 0.0065
        let y = self.latitude - 0.006
        let z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi)
        let theta = atan2(y, x) - 0.000003 * cos(x * x_pi)
        let CGJCorrdinate = CLLocationCoordinate2D(latitude: z * sin(theta), longitude: z * cos(theta))
        return CGJCorrdinate
    }
}
