//
//  Person.swift
//  17_06_19_懒加载的基本实现
//
//  Created by 姚懿恒 on 2017/6/20.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class Person: NSObject {

    //私有成员变量
    private var _name: String?

    //在Swift中, 一般不会重写getter跟setter方法, 仅供演示.
    var name: String?{
        get {

            //返回成员变量
            return _name
        }

        set {
            //使用成员变量 记录值
            _name = newValue
        }
    }

    //在OC中定义readonly属性, 对应Swift中就是重写getter方法, 不重写setter方法

//    var title: String?{
//        get {
//            return "Dr." + (name ?? "")
//        }
//    }

    //对只读属性的简写 - 直接return
    //类似与一个 '函数', 没有参数, 一定有返回值

    //又称为 '计算型'属性 - 执行函数返回其内存地址
    /*
        只实现getter方法的属性, 等同于OC中的readonly属性
        计算型属性本身不占用内存空间
        不可以给计算型属性设置数值
        计算型属性可以使用以下代码简写
     
     计算型属性与懒加载的对比
        计算型属性:
            1. 不分配独立的存储空间保存计算结果
            2. 每次调用时都会被执行
            3. 更像一个函数, 不过不能接收参数, 同时必须有返回值
        懒加载属性:
            1. 在第一次调用时, 执行闭包并分配空间存储闭包返回的数值
            2. 会分配独立的存储空间
            3. 与OC不同的是, lazy属性即使被设置成为nil, (只要掉用过一次, 懒加载后面的闭包就再不回执行了!)

     */
    var title: String?{
        return "Dr." + (name ?? "")
    }


    //懒加载的属性 lazyTitle, 本质上是一个闭包
    //属于'存储型'属性 - 需要开辟空间, 以存储数据
    //懒加载会在第一次访问的时候执行闭包, 闭包执行结束后, 会把结果保存在lazyTitle中, 
    //在后续的调用中, 直接返回 lazyTitle的内容, 不会返回新的内容
    //懒加载的属性会分配空间存储值
    lazy var lazyTitle: String = {

        return "lazy" + (self.name ?? "")
    }()



}
