//
//  ViewController.swift
//  17_05_14_定位
//
//  Created by 姚懿恒 on 2017/5/14.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController {

    ///Cannot convert value of type '() -> _' to specified type 'CLLocationManager'
    lazy var locationManager:CLLocationManager = {

        let locationManager = CLLocationManager()

        locationManager.delegate = self


        /*requestWhenInUseAuthorization只能在前台获取到用户的位置信息,即使不设置Background Modes为 ON, 也可获取.

         */
            locationManager.requestWhenInUseAuthorization()
//
//        //需要设置background mode 为ON, 否则程序崩掉且下面的值为true.才能完成位置的监听, 在后台时, 会出现蓝色框提示用户该app在使用位置信息.
//          在后台也获取位置信息
        //该方法是iOS9.0之后的方法.
            locationManager.allowsBackgroundLocationUpdates = true


    //前后台定位授权, 不需要设置background mode 为ON, 就能够监听前后台时的位置信息, 且后台状态不会出现蓝色框.此时的授权状态为 "authorizedAlways"
//        locationManager.requestAlwaysAuthorization()





        //之前的做法,通过代理方法, 处理返回位置信息的调用频率很高, 可以通过修改距离过滤来减缓调用频率
        //设置过滤距离为100m, 在物理环境中, 每移动100时, 会进行一次定位, 即调用locations: [CLLocation])
        locationManager.distanceFilter = 100;


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
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters

        return locationManager
    }()

    /// 点击时开始调用locationManager的开始获取位置方法

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {



        /*
         应用场景的选择:
         1) 如果要求定位及时,精度较高,并且运行时间较短,可使用标准定位;
         2) 如果长时间监控用户位置,用户移动速度比较快(例如打车软件),可使用后者
         */

        //标准定位服务:
        /*
            优点: 定位精确度高
            缺点: 耗电, 且程序关闭后无法进行定位
         */
        locationManager.startUpdatingLocation()

        //显著位置变化定位服务
        /*
            优点: 即使当app完全退出时, 也可以接受到位置通知
            缺点: 精确度不高
         */
        locationManager.startMonitoringSignificantLocationChanges()

        locationManager.requestLocation()
    }

}
extension ViewController: CLLocationManagerDelegate{
    ///通过代理方法, 处理返回位置信息

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("以获取....")
        print(locations)
    }


    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {


        switch status {
        case .authorizedWhenInUse:
            print("前台定位授权")
        case .authorizedAlways:
            print("前后台定位授权")

        case .denied:
            print("拒绝授权")
            //有两种情况会来到这个case
            /*
             1.用户关闭了位置服务.   ->提醒用户打开定位服务
             2.用户关闭了该应用的位置服务  -> 跪舔用户打开该应用允许访问位置服务
             */
                //该类方法确定用户是否启用了定位服务
            if CLLocationManager.locationServicesEnabled() {
                print("跪舔")

                //当用户已经 拒绝的情况下, 如果需要再次允许访问位置服务, 可以使用以下代码跳转到设置页面.
                //将UIApplicationOpenSettingsURLString转为URL
                let url1 = URL(string: UIApplicationOpenSettingsURLString)

                if let realURL = url1 {
                    //判断是否能打开URL
                    if UIApplication.shared.canOpenURL(realURL) {
                        //调用打开URL
                        UIApplication.shared.openURL(realURL)
                    }
                }


            }
            else
            {
                print("请打开定位服务")

            }
        case.notDetermined:
            print("还未决定")
        case .restricted:
            print("限制访问")
        default:
            print("- -")
        }
    }

}

