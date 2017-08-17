//
//  YYHAnnotation.swift
//  17_08_14地图的基本使用
//
//  Created by 姚懿恒 on 2017/8/16.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import MapKit

class YYHAnnotation: NSObject,MKAnnotation  {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)

    var title: String?

    var subtitle: String?


}
