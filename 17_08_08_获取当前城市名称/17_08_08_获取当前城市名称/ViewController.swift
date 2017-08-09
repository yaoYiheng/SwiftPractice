//
//  ViewController.swift
//  17_08_08_获取当前城市名称
//
//  Created by 姚懿恒 on 2017/8/9.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var placeLabel: UILabel!

    /// 懒加载位置管理者
    private lazy var locationManager: CLLocationManager = {

        let locationManager = CLLocationManager()
        locationManager.delegate = self

        if #available(iOS 8.0, *){
            locationManager.requestAlwaysAuthorization()
        }

        return locationManager

    }()

    private lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        locationManager.startUpdatingLocation()


    }

}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //判断地理位置是否有值
        //判断位置数据是否有效
        guard let location = locations.first else {return}
        if location.horizontalAccuracy < 0 {return}

        //反地理编码, 将代理传入的位置对象进行反地理编码
        geoCoder.reverseGeocodeLocation(location) { (placeMark, error) in
            //如果没有错误继续
            if error == nil{
                //一般获取placeMark的第一个元素
                guard let place = placeMark?.first else {return}


                //The city associated with the placemark.
                self.placeLabel.text = place.administrativeArea! + ", " + place.name! + ", " + place.country! + ", " + place.locality!
            }


        }
        locationManager.startUpdatingLocation()
    }

}
