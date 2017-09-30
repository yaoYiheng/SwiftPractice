//
//  ViewController.swift
//  17_09_22_不同应用间的跳转
//
//  Created by 姚懿恒 on 2017/9/22.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//
//        About — prefs:root=General&path=About
//        Accessibility — prefs:root=General&path=ACCESSIBILITY
//        AirplaneModeOn— prefs:root=AIRPLANE_MODE
//        Auto-Lock — prefs:root=General&path=AUTOLOCK
//        Brightness — prefs:root=Brightness
//        Bluetooth — prefs:root=General&path=Bluetooth
//        Date& Time — prefs:root=General&path=DATE_AND_TIME
//        FaceTime — prefs:root=FACETIME
//        General— prefs:root=General
//        Keyboard — prefs:root=General&path=Keyboard
//        iCloud — prefs:root=CASTLE  iCloud
//        Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
//        International — prefs:root=General&path=INTERNATIONAL
//          Location Services — prefs:root=LOCATION_SERVICES
//        Wi-Fi — prefs:root=WIFISetting—prefs:root=INTERNET_TETHERING
//        Wallpaper — prefs:root=Wallpaper
//        VPN — prefs:root=General&path=Network/VPN
//        Twitter — prefs:root=TWITTER  Usage — prefs:root=General&path=USAGE
//        Store — prefs:root=STORE
//        SoftwareUpdate— prefs:root=General&path=SOFTWARE_UPDATE_LINK
//        Sounds — prefs:root=Sounds
//        Siri — prefs:root=General&path=Assistant
//        Safari — prefs:root=Safari
//        Reset — prefs:root=General&path=Reset
//        Profile — prefs:root=General&path=ManagedConfigurationList
//        Phone — prefs:root=Phone  Photos — prefs:root=Photos
//        Notification — prefs:root=NOTIFICATIONS_ID
//        Notes — prefs:root=NOTES
//        Nike + iPod — prefs:root=NIKE_PLUS_IPOD
//        Network — prefs:root=General&path=Network
//        Music VolumeLimit— prefs:root=MUSIC&path=VolumeLimit
//         Music Equalizer — prefs:root=MUSIC&path=EQ
//        Music — prefs:root=MUSIC

import UIKit

class ViewController: UIViewController {

    @IBAction func toFriends() {

        let url = URL.init(string: "test1://friendList")

        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        else{
            print("没有安装")
        }

    }
    @IBAction func toMoment() {
        let url = URL.init(string: "test1://moments")

        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        else{
            print("没有安装")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        //iOS 9.0之前可以用以下方法打开
        //9.0之后需要在info.plist文件中设置
        // LSApplicationQueriesSchemes 数组: 添加白名单
//        let url = NSURL.init(string: "sms://10086")
//        UIApplication.shared.openURL(url! as URL)

        let url = URL.init(string: "test1://")

        //关于这个key: UIApplicationOpenURLOptionUniversalLinksOnly
        //如果将其设置为true, 只会当手机中装有该app时, 才会跳转,
        //如果设置为false, 手机中没有该app会从网页访问
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
//        UIApplication.shared.open(url!, options: options, completionHandler: nil)
        UIApplication.shared.open(url!, options: options, completionHandler: nil)

    }

}

