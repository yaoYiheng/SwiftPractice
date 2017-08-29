//
//  YHAnnotation.swift
//  17_08_22_测试划线
//
//  Created by 姚懿恒 on 2017/8/29.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import MapKit

class YHAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)


    // Title and subtitle for use by selection UI.
    public var title: String?

    public var subtitle: String?
}
