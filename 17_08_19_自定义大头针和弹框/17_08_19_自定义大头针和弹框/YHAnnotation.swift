//
//  YHAnnotation.swift
//  17_08_19_自定义大头针和弹框
//
//  Created by 姚懿恒 on 2017/8/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import MapKit

class YHAnnotation: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)


    // Title and subtitle for use by selection UI.
    var title: String?

    var subtitle: String?
}
