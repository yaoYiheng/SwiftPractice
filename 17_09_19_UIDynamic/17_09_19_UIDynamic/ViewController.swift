//
//  ViewController.swift
//  17_09_19_UIDynamic
//
//  Created by 姚懿恒 on 2017/9/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

/*
 使用UIDynamic来实现物理仿真效果, 大致的步骤如下
 1. 创建一个物理仿真器(顺便设置仿真范围)
 2. 创建相应的仿真行为
 UIDynamic提供了一下几种物理仿真行为: 重力, 碰撞, 捕捉, 推动
 3. 将物理方针行为添加到物理仿真器中 ->开始仿真
 */
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var box1: UIImageView!
    
    @IBOutlet weak var box2: UIImageView!
    //1.创建物理仿真器
    private lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "background")!)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        push()
        //执行重力仿真行为
        gravity()

        //执行碰撞行为
        collision()

    }

    /// 重力仿真
    private func gravity() {

        //创建仿真行为
        let gravityBehavior = UIGravityBehavior(items: [box1])

        //设置重力仿真行为的相关属性移动的角度以及初速度
//        gravityBehavior.setAngle(CGFloat(Double.pi), magnitude: 0.3)
        gravityBehavior.magnitude = 0.2

        //将仿真行为添加到物理仿真器中
        animator.addBehavior(gravityBehavior)

    }

    /// 碰撞仿真
    private func collision() {


    }

    /// 捕捉仿真
    private func snap() {

    }

    /// 推动仿真
    private func push() {
        //
        //创建推动仿真行为
        //        continuous: 推动力会一直作用在物体上
        //        instantaneous: 不会持续, 推过之后物理保持当前状态
        let push = UIPushBehavior(items: [box1], mode: .continuous)

        //还需要设置推的方向数值越大速度越快
        push.pushDirection = CGVector.init(dx: 0, dy: -1)

        animator.removeBehavior(push)

        animator.addBehavior(push)


    }

}

