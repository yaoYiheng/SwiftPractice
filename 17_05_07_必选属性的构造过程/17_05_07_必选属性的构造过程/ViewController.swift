//
//  ViewController.swift
//  17_05_07_必选属性的构造过程
//
//  Created by 姚懿恒 on 2017/5/7.
//  Copyright © 2017年 姚懿恒. All rights reserved.
/*
    
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let hun1 = Human.init(name: "老王")
        print(hun1)

        let st1 = Student.init(name: "老罗", NO: "123")
        print(st1.name + "----" + st1.NO)


        let t1 = Teacher.init(dict:["serialID": "IOSD123", "age": 123, "title": "Dr", "gender": "male"])
        print("\(t1.serialID) \(t1.age)")


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

