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

//    var mapView = MAMapView()
    var mapView: GMSMapView?

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
        initMapView()
    }

    func initMapView() {
        mapView = GMSMapView()
        mapView?.delegate = self
        mapView?.frame = UIScreen.main.bounds
        view.addSubview(mapView!)

    }


}


extension ViewController: GMSMapViewDelegate{

}

