//
//  ViewController.swift
//  17_08_04_CLLocation
//
//  Created by 姚懿恒 on 2017/8/4.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    //懒加载locationManager
    private lazy var locationManager : CLLocationManager = {
        //实例化
        let locationManager = CLLocationManager()

        //设置代理
        locationManager.delegate = self


        if #available(iOS 8.0, *) {
            locationManager.requestWhenInUseAuthorization()


            // 如果在ios9.0以后, 想要在后台获取用户位置,
            // 如果当前的授权状态是前台定位授权, 那么你需要勾选后台模式 location updates, 还要额外的设置以下属性为true
            // 注意: 如果设置这个属性为true, 那么必须勾选后台模式
            if #available(iOS 9.0, *) {
                locationManager.allowsBackgroundLocationUpdates = true
            }

            // 前后台定位授权
            // 如果当前的授权状态是前后台定位授权, 那么默认情况下, 就可以在后台获取用户位置信息, 不需要勾选后台模式location updates

            //            locationM.requestAlwaysAuthorization()
        }

        //设置位置过滤器, 只有当移动指定的距离, 才进行一次更新
//        locationManager.distanceFilter = 100

        //设置精确度
        /*
         kCLLocationAccuracyBestForNavigation: CLLocationAccuracy //最适合导航的精确度
         kCLLocationAccuracyBest: CLLocationAccuracy  //最好的精确度
         kCLLocationAccuracyNearestTenMeters: CLLocationAccuracy //最近10m精确度
         kCLLocationAccuracyHundredMeters: CLLocationAccuracy   //最近100m
         kCLLocationAccuracyKilometer: CLLocationAccuracy       最近1000m
         kCLLocationAccuracyThreeKilometers: CLLocationAccuracy  //最近3000
         */
        //精确度越高, 耗电量越大
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation


        return locationManager

    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        locationManager.startUpdatingLocation()

        //不能与startUpdatingLocation 和allowDeferredLocationUpdates同时使用
        //在有限的时间内, 精确度由低到高
        //传递一次用户请求的当前位置
        locationManager.requestLocation()
    }


}
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        //获取最新的地点
        let newLocation = locations.last
        //当前纬度
        let latitude = newLocation?.coordinate.latitude
        //当前经度
        let longitude = newLocation?.coordinate.longitude
        //当前海拔
        let altitude = newLocation?.altitude
        //当前速度
        let speed = newLocation?.speed
        //当前角度
        let course = newLocation?.course
        //由于都是可选值, 需要解包
        //        horizontalAccuracy与verticalAccuracy:如果为负值, 则数据无效
        print("当前经纬度为: \(longitude!) -- \(latitude!)--海拔为\(altitude!)--速度为\(speed!)--角度为\(course!)")

        //初始化坐标以及两点间距离
        let loc1:CLLocation = CLLocation.init(latitude: 0, longitude: 111)
        let loc2: CLLocation = CLLocation.init(latitude: 0, longitude: 112)
        let disctance: CLLocationDistance = loc1.distance(from: loc2)

        print("距离为\(disctance)")



    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

