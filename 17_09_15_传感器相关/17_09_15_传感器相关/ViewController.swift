//
//  ViewController.swift
//  17_09_15_传感器相关
//
//  Created by 姚懿恒 on 2017/9/15.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        proximityTest()

    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func proximityTest() {
        //开启距离传感器
        UIDevice.current.isProximityMonitoringEnabled = true

        //距离传感器通过通知中心发送消息
        //在通知中心中监听状态的改变
        NotificationCenter.default.addObserver(self, selector: #selector(statusChange), name: NSNotification.Name.UIDeviceProximityStateDidChange, object: nil)

    }

    @objc private func statusChange() {
        if UIDevice.current.proximityState {
            print("something is approaching")
        }else{
            print("someting is leaving")
        }
    }



}

