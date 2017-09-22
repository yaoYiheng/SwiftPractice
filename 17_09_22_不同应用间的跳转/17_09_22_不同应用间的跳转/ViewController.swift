//
//  ViewController.swift
//  17_09_22_不同应用间的跳转
//
//  Created by 姚懿恒 on 2017/9/22.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        //iOS 9.0之前可以用以下方法打开
        //9.0之后需要在info.plist文件中设置
        // LSApplicationQueriesSchemes 数组: 添加白名单
//        let url = NSURL.init(string: "sms://10086")
//        UIApplication.shared.openURL(url! as URL)

        let url = URL.init(string: "https://twitter.com/kharrison")

        //关于这个key: UIApplicationOpenURLOptionUniversalLinksOnly
        //如果将其设置为true, 只会当手机中装有该app时, 才会跳转,
        //如果设置为false, 手机中没有该app会从网页访问
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
//        UIApplication.shared.open(url!, options: options, completionHandler: nil)
        UIApplication.shared.open(url!, options: options, completionHandler: nil)

    }

}

