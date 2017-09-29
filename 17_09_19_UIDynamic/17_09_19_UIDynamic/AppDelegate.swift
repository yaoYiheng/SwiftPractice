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



    /// 当其他的app通过url跳转到该app时, 会调用该方法(9.0之后)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

        guard let host = url.host else { return true }

        //取出导航控制器
        let nav = window?.rootViewController as? UINavigationController
        //压栈前先pop,来解决重复返回的bug
        nav?.popViewController(animated: true)

        //取出导航控制器的根控制器
        let vc = nav?.childViewControllers[0]


        //根据不同的host跳转到不同的页面
        if host == "friendList" {
            vc?.performSegue(withIdentifier: "friendsList", sender: nil)
        }
        if host == "moments" {
            vc?.performSegue(withIdentifier: "moments", sender: nil)
        }


        return true
    }


    /// 已过期
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return true
    }

}

