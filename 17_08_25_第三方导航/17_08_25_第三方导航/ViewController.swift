//
//  ViewController.swift
//  17_08_25_第三方导航
//
//  Created by 姚懿恒 on 2017/8/25.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var mapView = MAMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initMapView()
    }

    private func initMapView() {
        mapView.frame = view.bounds
        mapView.delegate = self
        mapView.mapType = .standard
        view.addSubview(mapView)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: MAMapViewDelegate{

}


