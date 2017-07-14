//
//  AppDelegate.swift
//  17_06_21_反射机制
//
//  Created by 姚懿恒 on 2017/6/21.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /*
        1. 知道Swift中有命名空间
            - 在同一个命名空间下, 全局共享
            - 第三方框架中 Swift 如果直接拖拽到项目中, 从属于同一个命名空间, 很有可能冲突
            - 以后尽量都要用 CocoaPods
        2. 重点要知道 Swift中, NSClassFromString(反射机制的写法)
            - 反射机制最重要的目的就是为了解耦
            - 搜索了解学习 '反射机制和工厂方法'
            - 提示: 第一印象会发现一个简单的功能, 写的很复杂
            - 但是封装的很好, 而且弹性很大

     */

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //1. 初始化
        window = UIWindow()

        //2. 设置根控制器, 需要添加命名空间 ->默认就是 '项目名称'(最好不要有数字和特殊符号)
//        let clsName = "17_06_21_反射机制.ViewController"
//
//        //AnyClass? -> 视图控制器的类型
//        let cls = NSClassFromString(clsName) as? UIViewController.Type

        //从info.plist 中加载命名空间

        // **解包**
        //1. 因为字典是可选的, 因此需要解包再取值
        //  如果 字典 为 nil, 就不需要取值  
        //2. 通过key从字典取值, 如果key错了, 就没有值了
        // AnyObject? 表示不一定能够取到值
        let nameSpace = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""

        let clsName = nameSpace + "." + "ViewController"

        let cls = NSClassFromString(clsName) as? UIViewController.Type

        //代码中的 ? 都是 '可选'解包, 发送消息不参与计算
        let vc = cls?.init()

        window?.rootViewController = vc

        //3. 使窗口可见
        window?.makeKeyAndVisible()



        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

