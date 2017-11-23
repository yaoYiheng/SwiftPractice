//
//  ViewController.swift
//  17_11_23_Order
//
//  Created by 姚懿恒 on 2017/11/23.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     lazy var food: [Array<Any>] = {
        //从Bundle中加载plist文件
        let path = Bundle.main.path(forResource: "Food.plist", ofType: nil)

        return NSArray.init(contentsOfFile: path!) as! [Array<Any>]
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        print(food)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

