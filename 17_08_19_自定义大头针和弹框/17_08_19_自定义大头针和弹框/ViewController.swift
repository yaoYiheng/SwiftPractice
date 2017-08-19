//
//  ViewController.swift
//  17_08_19_自定义大头针和弹框
//
//  Created by 姚懿恒 on 2017/8/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    ///点击后添加大头针
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }

}
extension ViewController: MKMapViewDelegate{
    /// 返回大头针视图
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        <#code#>
    }
}

