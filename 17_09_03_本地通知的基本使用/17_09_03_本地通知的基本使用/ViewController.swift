//
//  ViewController.swift
//  17_09_03_本地通知的基本使用
//
//  Created by 姚懿恒 on 2017/9/3.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendNot() {

        print("来没来")
        // 1. 创建一个本地通知
//        let localNot = UILocalNotification()
//        // 1.1 设置通知的必选项
//        localNot.alertBody = "发发发通知!?"
//        // 1.2 通知的发送时间
//        localNot.fireDate = NSDate(timeIntervalSinceNow: 2) as Date



        // 2. 发送本地通知
        // 应用程序级别的操作
//        //        UIApplication.sharedApplication().presentLocalNotificationNow(localNot)
//        UIApplication.shared.scheduleLocalNotification(localNot)

        //copy thoes codes from website but it doesnot work
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey:
            "Hello!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey:
            "Hello_message_body", arguments: nil)

        // Deliver the notification in five seconds.
        content.sound = UNNotificationSound.default()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)

        // Schedule the notification.
        let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)


    }


    @IBAction func cancelBot() {
//        UIApplication.shared.cancelAllLocalNotifications()
        //通过消息发送中心取消
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()


    }
    
    @IBAction func viewNot() {

        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests { (request) in
            print(request)
        }
//        print(UIApplication.shared.scheduledLocalNotifications)
    }
    
    
}

