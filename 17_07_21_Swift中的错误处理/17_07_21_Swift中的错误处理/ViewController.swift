//
//  ViewController.swift
//  17_07_21_Swift中的错误处理
//
//  Created by 姚懿恒 on 2017/7/21.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonString = "{\"name\": \"Zhangsan\"}"
        //将字符串转换成data
        let data = jsonString.data(using: .utf8)

        //反序列化 throw抛出异常
        //方法一: 推荐使用try? 如果解析成功, 则有值, 否则为nil
        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
        print(json)

        //方法二: 不推荐使用try!如果解析成功, 则有值, 否则fatal error 程序崩溃
        let json2 = try! JSONSerialization.jsonObject(with: data!, options: [])
        print(json)

        //方法三: do catch处理异常, 能够接受并且输出错误
        do{
            let json3 = try JSONSerialization.jsonObject(with: data!, options: [])
            print(json3)
        }catch{
            print(error)
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

