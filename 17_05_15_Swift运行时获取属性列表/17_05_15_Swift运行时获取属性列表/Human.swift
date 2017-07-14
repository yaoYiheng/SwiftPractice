//
//  Human.swift
//  17_05_15_Swift运行时获取属性列表
//
//  Created by 姚懿恒 on 2017/5/15.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class Human: NSObject {
    var name: String?
    var age: Int = 0
    var weight: Double = 0.0
    var gender: String?
    var friends: [String]?

    class func propertyList() ->[String]{

        var count: UInt32 = 0

        //class_copyPropertyList返回的是属性列表的数组
        let list = class_copyPropertyList(self, &count)


        var prolList:[String] = []

//        //遍历数组列表
//        for i in 0..<Int(count) {
//
//            //根据下标获取 属性 objc_property_t?
//            let property = list?[i]
//
//
//            //从objc_property_t?类型中, 通过property_getName(函数), 得到'属性' 名称
//            //类型是C语言的字符串
//            let cName = property_getName(property!)
//
//            //将c字符串装换为OC字符串
//            let name = String(utf8String: cName!)
//
//
//
//            //添加到数组中并返回
//            prolList.append(name!)
//        }


        //使用guard let进行是否有值的判断.
        //遍历数组列表
        for i in 0..<Int(count) {

            guard let property = list?[i],
            let cName = property_getName(property),
            let name = String(utf8String: cName)

            else {
                continue

            }

            //根据下标获取 属性 objc_property_t?
//            let property = list?[i]


            //从objc_property_t?类型中, 通过property_getName(函数), 得到'属性' 名称
            //类型是C语言的字符串
//            let cName = property_getName(property!)

            //将c字符串装换为OC字符串
//            let name = String(utf8String: cName!)



            //添加到数组中并返回
            prolList.append(name)
        }


        free(list)

        return prolList
    }

}
