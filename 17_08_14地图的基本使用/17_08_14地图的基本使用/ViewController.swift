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

        locationProperty()
    }

    func locationProperty() -> Void {
        //地图的显示类型
        mapView.mapType = .hybrid

        //是否允许旋转, 相关属性还有是否允许缩放, 捏合, 滚动
        mapView.isRotateEnabled = false
        //用户的追踪模式, 需要请求用户位置授权才能使用该功能
        //方式1, 显示蓝点, 不会自动放大地图, 当用户移动时, 不会自动跟跑
                mapView.showsUserLocation = true
        //        方式2
        // 显示蓝点, 会自动放大地图, 当用户移动时, 会自动跟跑
        //        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
//        mapView.userTrackingMode = .follow

        _ = locationManager

        //通过代理监听用户位置的移动
        mapView.delegate = self

    }

    //当点击时在地图上添加一个大头针
    //在地图上操作大头针, 实际上就是操作大头针的数据模型

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let annotation = YYHAnnotation()
        annotation.coordinate = mapView.centerCoordinate

        mapView.addAnnotation(annotation)
    }


}


extension ViewController: MKMapViewDelegate{

    /// 当地图更新用户位置时, 会调用该方法
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {

        //MKUserLocation: 大头针数据模型

        //设置地图中心的经纬度坐标为用户当前坐标
        mapView.setCenter((userLocation.location?.coordinate)!, animated: true)

        let span = MKCoordinateSpanMake(0.02, 0.02)

        let region = MKCoordinateRegionMake((userLocation.location?.coordinate)!, span)
        //可调用该方法对显示区域进行缩放至合适范围.
        mapView.setRegion(region, animated: true)

    }

    ///当区域改变时会调用该方法
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        //
        _ = mapView.region.span.latitudeDelta
        _ = mapView.region.span.longitudeDelta
    }
}

