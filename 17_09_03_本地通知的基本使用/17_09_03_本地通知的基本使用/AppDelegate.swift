//
//  AppDelegate.swift
//  17_09_03_本地通知的基本使用
//
//  Created by 姚懿恒 on 2017/9/3.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //使用UNUserNotificationCenter来管理通知
        // 1、请求用户授权：
        let center = UNUserNotificationCenter.current()
        //处理通知：设置UNUserNotificationCenterDelegate：
        //注意：UNUserNotificationCenter的delegate必须在application:willFinishLaunchingWithOptions: or application:didFinishLaunchingWithOptions:方法中实现；

        center.delegate = self

        //请求授权选项：
        // UNAuthorizationOption Badge= 1 (1 << 0), ( bædʒ校徽)
        // UNAuthorizationOption Sound= 2 (1 << 1),
        // UNAuthorizationOption Alert= 4 (1 << 2),
        // UNAuthorizationOption CarPlay = 8 (1 << 3),

        //2、iOS 10使用以下方法注册，才能得到授权，注册通知以后，会自动注册deviceToken，如果获取不到deviceToken，Xcode8下要注意开启Capability->Push Notification。

        //请求获取通知权限（角标，声音，弹框）


        center.requestAuthorization(options: UNAuthorizationOptions(rawValue: UNAuthorizationOptions.RawValue(UInt8(UNAuthorizationOptions.alert.rawValue) | UInt8(UNAuthorizationOptions.sound.rawValue) | UInt8(UNAuthorizationOptions.badge.rawValue)))) { (granted, error) in
            if granted {
                print("request authorization successed!")
            }
        }

        //或者你也可以以用 “  |  ”     ( kəmˈpliʃ(ə)n  完成   ˈhandlə,处理者)
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
//            if (granted) {
//            //获取用户是否同意开启通知
//            NSLog(@"request authorization successed!");
//            }
//            }];
        // 3、补充：获取当前的通知设置，UNNotificationSettings是只读对象，不能直接修改，只能通过以下方法获取
        center.getNotificationSettings { (settings) in
            // UNAuthorizationStatus NotDetermined :没有做出选择
            // UNAuthorizationStatus Denied :用户未授权
            // UNAuthorizationStatus Authorized：用户已授权
            if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                print("已授权")
            }
            else if settings.authorizationStatus == UNAuthorizationStatus.denied{
                print("未收权")
            }

        }



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
extension AppDelegate: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
}

