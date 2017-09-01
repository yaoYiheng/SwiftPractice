//
//  ViewController.swift
//  17_08_25_第三方导航
//
//  Created by 姚懿恒 on 2017/8/25.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    var mapView = MAMapView()
    //位置管理者
    private lazy var locationManager: CLLocationManager = {
        let locationaManager = CLLocationManager()

        locationaManager.requestAlwaysAuthorization()


        return locationaManager
    }()

    //地理编码
    private lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        initMapView()
    }

    //使用google地图sdk
//    override func loadView() {
//        // Create a GMSCameraPosition that tells the map to display the
//        // coordinate -33.86,151.20 at zoom level 6.
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        view = mapView
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//    }
    //创建初始化地图
    private func initMapView() {
        mapView.frame = view.bounds
        mapView.delegate = self
        mapView.mapType = .satellite
        mapView.userTrackingMode = .follow
        //设置地图相关属性
        mapView.maxZoomLevel = 16
        mapView.minZoomLevel = 3
        mapView.isRotateEnabled = false
        mapView.showsCompass = false

        view.addSubview(mapView)

    }
}


// MARK: - <#MAMapViewDelegate#>
extension ViewController: MAMapViewDelegate{

    //长按时调用
    func mapView(_ mapView: MAMapView!, didLongPressedAt coordinate: CLLocationCoordinate2D) {
        
    }

}


