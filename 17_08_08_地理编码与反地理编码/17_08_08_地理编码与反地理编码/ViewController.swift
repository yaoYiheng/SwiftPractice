//
//  ViewController.swift
//  17_08_08_地理编码与反地理编码
//
//  Created by 姚懿恒 on 2017/8/8.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // 输入地址
    @IBOutlet weak var addressTextField: UITextView!
    //输入纬度
    @IBOutlet weak var latitudeTextField: UITextField!
    //输入经度
    @IBOutlet weak var longtitudeTextField: UITextField!

    /// 地理编码: 将地址转换成为经纬度
    @IBAction func geoCode() {
    }
    
    /// 反地理编码: 将经纬度转换成地址
    @IBAction func reverseGeoCode() {
    }
    
}

