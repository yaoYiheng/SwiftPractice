//
//  ViewController.swift
//  17_08_22_测试划线
//
//  Created by 姚懿恒 on 2017/8/22.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var mapView: MKMapView!

    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()

        locationManager.requestAlwaysAuthorization()

        //设置位置管理者的代理
        locationManager.delegate = self


        return locationManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = locationManager
        initMapView()
    }

    private func initMapView() {
        mapView = MKMapView()
        mapView.delegate = self
        mapView.frame = view.bounds
        mapView.mapType = .hybrid

        mapView.userTrackingMode = .followWithHeading
//        mapView.showsUserLocation = true
        view.addSubview(mapView)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        locationManager.startUpdatingLocation()
    }
}


// MARK: - <#CLLocationManagerDelegate#>
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        if location.horizontalAccuracy < 0 {return}

        print(location)
    }


}
// MARK: - <#MKMapViewDelegate#>
extension ViewController: MKMapViewDelegate{

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        <#code#>
    }


}

