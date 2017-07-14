//
//  ViewController.swift
//  17_06_19_懒加载的基本实现
//
//  Created by 姚懿恒 on 2017/6/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    //属性的声明
    var label: TestLabel?

    //懒加载
    /*
        1. 能够延迟创建
        2. 最大的好处, 解除解包的烦恼
     */
//    lazy var lazyLabel: TestLabel = TestLabel()

    //懒加载的完整写法
    /*
     懒加载本质上是一个闭包
     {}包装代码块,
     ()执行
     
     但在日常开发中不建议这样书写, 
     1. 智能提示不灵
     2. 如果闭包中出现self, 还需要注意循环引用的问题
     */
    /*
        和OC中的懒加载的区别
     在Swift中, 一旦将通过懒加载的控件设置为nil之后, 懒加载也不会再次执行
     懒加载的代码只会在第一次调用的时候, 执行闭包, 然后将闭包的结果保存在属性当中
     
     */
    lazy var lazyLabel = { () -> (TestLabel) in

        let label = TestLabel()

        //设置其属性...

        return label

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        //正常创建加载方式
        addLabelWithoutLazy()

        //懒加载方式
        addLabelWithLazy()

        let p = Person()
        p.name = "哈哈"

        print(p.name!);

        let label = TestLabel.init(frame: CGRect.init(x: 50, y: 100, width: 100, height: 20))

        label.person = p

        view.addSubview(label)




    }



    func addLabelWithLazy() {

        lazyLabel.text = "How is going?"
        lazyLabel.sizeToFit()
        lazyLabel.center = view.center
        view.addSubview(lazyLabel)


    }
    func addLabelWithoutLazy() {
        //初始化并分配空间
        label = TestLabel()

        //添加到视图
        // ? 可选解包, 调用方法, 如果为nil, 则不调用方法, 但不能参与计算
        // ! 强制解包, 为了参与计算, 数组中不能插入nil.
        label?.text = "你好"
        label?.sizeToFit()
        label?.center = view.center
        view.addSubview(label!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

