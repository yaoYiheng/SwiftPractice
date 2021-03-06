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

    lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()

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

        //将touches的点提取出来
        guard let touch = touches.first else {return}
        let point = touch.location(in: mapView)

        //将在mapview上的点转换成经纬度
       let coordinate = mapView.convert(point, toCoordinateFrom: mapView)

        //拿到通过自定义的方法返回的大头针对象
        let annotation = addAnnotation(coordinate, title: "未知", subtitle: "未知")

        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)


        //通过反地理编码将经纬度信息转成地理信息
        geoCoder.reverseGeocodeLocation(location) { (placeMark, error) in
            //将通过闭包传递的大头针模型设置到
            if error == nil {
                let pl = placeMark?.first
                print(pl)
                annotation.title = pl?.locality
                annotation.subtitle = pl?.name

            }
        }


    }

    /// 向视图中添加大头针
    ///
    /// - Parameters:
    ///   - coordinate: 经纬度
    ///   - title: 标题
    ///   - subtitle: 副标题
    private func addAnnotation(_ coordinate: CLLocationCoordinate2D, title: String, subtitle: String) -> YYHAnnotation{

        let annotation: YYHAnnotation = YYHAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subtitle

        mapView.addAnnotation(annotation)

        return annotation
    }

}


extension ViewController: MKMapViewDelegate{

    /// 当地图更新用户位置时, 会调用该方法
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//
//        //MKUserLocation: 大头针数据模型
//
//        //设置地图中心的经纬度坐标为用户当前坐标
////        mapView.setCenter((userLocation.location?.coordinate)!, animated: true)
//
//        let span = MKCoordinateSpanMake(0.02, 0.02)
//
//        let region = MKCoordinateRegionMake((userLocation.location?.coordinate)!, span)
//        //可调用该方法对显示区域进行缩放至合适范围.
//        mapView.setRegion(region, animated: true)

    }

    ///当区域改变时会调用该方法
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        //
        _ = mapView.region.span.latitudeDelta
        _ = mapView.region.span.longitudeDelta
    }


    /// 当添加一个大头针数据模型到地图上时, 就会自动调用该代理方法, 来查找对应的大头针视图
    /// 自定义大头针视图
    /// - Parameters:
    ///   - mapView: 地图
    ///   - annotation: 大头针模型
    /// - Returns: 大头针"视图"
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        //系统自带的大头针, 与cell类似, 都是采用复用机制, 首先从缓存池中获取, 如果获取不到在创建新的
        //1. 从缓存池中获取
        let identifier = "item"

        //强转成子类
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)  as? MKPinAnnotationView

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        //显示弹窗
        annotationView?.canShowCallout = true

        //设置大头针的颜色
        annotationView?.pinTintColor = UIColor.cyan

        return annotationView
    }
}

