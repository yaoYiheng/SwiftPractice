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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

