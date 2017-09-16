//
//  ViewController.swift
//  17_09_15_传感器相关
//
//  Created by 姚懿恒 on 2017/9/15.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let motionManager: CMMotionManager = CMMotionManager()


    override func viewDidLoad() {
        super.viewDidLoad()

        //测试距离传感器
        proximityTest()

        //测试加速计
        motionTest()

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


    private func motionTest() {

        if motionManager.isAccelerometerAvailable == false {
            print("加速计不可用")
            return
        }

        motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
            if error == nil{
                print(data)
            }
        }


    }

}

