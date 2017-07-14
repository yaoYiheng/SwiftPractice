//
//  Student.swift
//  17_05_07_必选属性的构造过程
//
//  Created by 姚懿恒 on 2017/5/8.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class Student: Human {
    var NO: String

    /// 重写 '父类' 的init方法
//    override init() {
//        self.NO = "001"
//
//        super.init()
//    }

    /// 重载, 函数名相同, 但是参数和个数不同
    /// 重载可以给自己的属性从外部设置初始值
    /// 在OC中是没有重载的
    // 重载也需要调用父类的构造函数
//    init(NO: String){
//        self.NO = NO
//
//        //调用父类的构造函数
//        super.init()
//    }

    init(name: String, NO: String) {
        self.NO = NO

        super.init(name: name)
    }


}
