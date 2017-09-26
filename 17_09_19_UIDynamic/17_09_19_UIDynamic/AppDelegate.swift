//
//  AppDelegate.swift
//  17_09_19_UIDynamic
//
//  Created by 姚懿恒 on 2017/9/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }



    /// 当其他的app通过url跳转到该app时, 会调用该方法
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

        print(url)

        return true
    }

}

