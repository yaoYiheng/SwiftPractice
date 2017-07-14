//
//  TestLabel.swift
//  17_06_19_懒加载的基本实现
//
//  Created by 姚懿恒 on 2017/6/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class TestLabel: UILabel {


    ///模型: 给视图设置模型, 有视图自己根据模型的数据, 决定显示内容
    var person: Person?{

        ///didSet 就是用来代替OC中重写setter 方法
        // 区别: 再也不需要考虑 _成员变量 = 值
        //OC 中如果是copy 属性, 应该 _成员变量 = 值.copy

        didSet {
            //name属性已经有值, 可以直接使用设置 UI 内容
            text = person?.name

        }
    }
    //重写构造函数
    //xib不会调用, 纯代码专用
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // initWithCoder: 是使用xib / storyboard开发的入口
    //提示: 所有的UIView及其子类, 一旦重写了构造函数, 就必须实现initWithCoder 以保证提供两个通道
    required init?(coder aDecoder: NSCoder) {

        //禁止xib/storyboard使用本类
        fatalError("init(coder:) has not been implemented")
    }

}
