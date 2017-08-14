//
//  ViewController.swift
//  17_08_14地图的基本使用
//
//  Created by 姚懿恒 on 2017/8/14.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!

    lazy var locationManager: CLLocationManager = {

        let locationManager = CLLocationManager()

        locationManager.requestAlwaysAuthorization()

        return locationManager

    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        //地图的显示类型
        mapView.mapType = .hybrid

        //是否允许旋转, 相关属性还有是否允许缩放, 捏合, 滚动
        mapView.isRotateEnabled = false
        //用户的追踪模式, 需要请求用户位置授权才能使用该功能
        //方式1, 显示蓝点, 不会自动放大地图, 当用户移动时, 不会自动跟跑
//        mapView.showsUserLocation = true
//        方式2
        // 显示蓝点, 会自动放大地图, 当用户移动时, 会自动跟跑
//        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
        mapView.userTrackingMode = .follow

        _ = locationManager

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

