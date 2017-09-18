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
    @IBOutlet weak var showLabel: UILabel!
    
    let motionManager: CMMotionManager = CMMotionManager()

    //创建计步器对象
    let stepCounter: CMStepCounter = CMStepCounter()


    override func viewDidLoad() {
        super.viewDidLoad()

        //测试距离传感器
        proximityTest()

        //测试加速计
//        motionTest()

        //计步器测试
        stepTest()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func stepTest() {
        if !CMStepCounter.isStepCountingAvailable(){
            return
        }

        let begin = Date.init(timeIntervalSinceNow: -24 * 60 * 60)
        let end = Date.init(timeIntervalSinceNow: 0)

        stepCounter.queryStepCountStarting(from: begin, to: end, to: OperationQueue.main) { (count, error) in
            print("走了\(count)步")
        }
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

        //设置数据采集的间隔
        motionManager.accelerometerUpdateInterval = 1.0
        //push模式, 把数据主动告诉外界
//        motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
//            if error == nil{
//                print(data)
//            }
//        }

        //开始采集数据
        motionManager.startAccelerometerUpdates()

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("点击获取当前数据\(motionManager.accelerometerData?.acceleration)" )
    }

}


// MARK: - 摇一摇功能的扩展
extension ViewController{
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        showLabel.text = "开始摇一摇"
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        showLabel.text = "摇一摇结束"
    }
    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
        showLabel.text = "摇一摇取消"
    }
}

