//
//  Teacher.swift
//  17_05_07_必选属性的构造过程
//
//  Created by 姚懿恒 on 2017/5/8.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
/*
    1. 在定义模型 '属性' 的时候,如果是类(这里指的是String类似) 通常都是'可选'的
      这样做的好处:1. 在需要的时候才去创建, 2. 避免写构造函数可以简化代码

    2. 如果存在属性是基本数据类型的情况, 则不能将其设置为'可选'类型, 而且需要为其设置初始值.

    3. 如果使用KVC为属性赋值时, 属性不能是 私有(private) 的

    4. 在使用KVC之前, 应调用super.init(), 保证对象实例化完成

 */
class Teacher: Human {

    var serialID: String?

    /*
     初始化基本数据类型.
     使用图KVC为其进行赋值会报错, (找不到age 这个key), 
     原因在于: 在Swift中Int是一个基本数据类型的结构体, OC中只有基本数据类型, 没有可选值一说
     */
//    var age: Int?
    //不能设置为可选值, 且需要设置初始值, 否则KVC会崩
    var age: Int = 0


    //在使用KVC为属性赋值时, 如果待赋值的属性是 私有(private)的, 同样无法设置.
    //被设置成为 private 的属性/方法, 在外部是绝对禁止访问的.
    var title: String?


    /// 重载构造函数, 使用字典为该类设置初始值
    init(dict: [String: Any]) {

        //保证对象已完成初始化
        super.init()

        /*
 Use of 'self' in method call 'setValuesForKeys' before super.init initializes self

         *** 使用 self 的 setValuesForKeys 之前需调用 super.init 初始化自身 ***


 Super.init isn't called on all paths before returning from initializer
         在子类的构造器中，父类的成员变量必须通过父类的designated initializer进行初始化

         */

        /*
        通过KVC为属性赋值, KVC属于OC的方法, OC的方法是在运行时给对象发送消息, 
         这就要求对象已经完成实例化, 
         所以需要在调用setValuesForKeys之前调用父类的init()方法, 保证对象已完成初始化
         */
        setValuesForKeys(dict)
    }

    /// 在开发中, 从服务器返回的字典比属性多的情况很常见, 如果属性中的key不存在, 默认情况则会保存异常, 可以通过重写父类方法, 解决抛出异常的情况
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        super.setValue(value, forUndefinedKey: key)
    }

}
