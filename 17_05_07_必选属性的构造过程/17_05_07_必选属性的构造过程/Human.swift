//
//  Human.swift
//  17_05_07_必选属性的构造过程
//
//  Created by 姚懿恒 on 2017/5/7.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

/*
 初始化过程:
 1. 构造函数的目的: 给自己的属性分配内存空间并设置初始值
 2. 调用父类构造函数之前, 需要先给本类的属性设置初始值
 3. 调用父类的 构造函数 super.init(), 给父类的属性分配空间并设置初始值
 NSObject没有属性, 只有一个成员变量 'isa'
 4. 如果重载了构造函数, 并且没有重写父类的 init 方法, 系统将不在提供构造函数
    - 因为 默认的构造函数不能给本类的属性分配空间
 */

/*
构造函数 是一种特殊的函数

 * 主要用来在创建对象时初始化对象
 * 为对象 成员变量 设置初始值

 */

/* 重载  overload 的概念*/
/*

 *函数名相同
 *参数类型和个数不同

 */
/* 重写 override 的概念*/

/*
 
 *父类存在相同的方法
 *子类重新编写父类方法的实现
 
 */

import UIKit
/// Class 'Human' has no initializers
//1. Human类没有初始化器
class Human: NSObject {

    var name: String

    // Overriding declaration requires an 'override' keyword
    //2.重写声明需要加上override关键字
    override init() {

        // Property 'self.name' not initialized at implicitly generated super.init call
        //3.属性'self.name' 未在隐式生成的 super.init 调用中被初始化, 需要先初始化


        // Property 'self.name' not initialized at super.init call 
        //4. 没有在给用父类的init()方法前 初始化属性self.name

        /*
         在Swift中, 首先初始化当前类的属性, 再去初始化父类的属性, 在OC中刚好相反
         */

        self.name = "HU"
        super.init()
        //注意: 不允许在调用父类构造函数之后, 再为本类的属性分配空间并且初始化

    }
    init(name: String) {

        self.name = name
        super.init()
    }

    //小结
    /*
        * 非Optional 属性, 都必须在构造函数中设置初始值, 从而保证对象在被实例化的时候, 属性都被正确初始化
        * 在调用父类构造函数之前, 必须保证本类的属性都应完成初始化
        * Swift中的构造函数不用写 func
    
     */

}
