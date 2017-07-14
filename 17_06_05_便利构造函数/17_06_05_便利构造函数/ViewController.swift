//
//  ViewController.swift
//  17_06_05_便利构造函数
//
//  Created by 姚懿恒 on 2017/6/5.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

/*
 便利构造函数
 
 目的:
 条件判断, 只有满足条件, 才实例化对象, 可以防止造成不必要的内存开销
 简化对象的创建
 本身不负责属性的创建和初始化工作
 
 特点:
 默认情况下, 所有的构造方法都是指定构造函数 Designed
 convenience, 关键字修饰的构造方法就是便利构造函数
 便利构造函数具有以下特点:
    可以返回nil
    只有便利构造函数中可以调用self.init()
    便利构造函数不能被重写或super
    便利构造函数只要勇于条件监测或者简化对象创建
 */

import UIKit

class ViewController: UIViewController {

    var number1 = UITextField()
    var number2 = UITextField()
    var resultLable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUI() -> () {
//        let textField1 = UITextField.init(frame: CGRect.init(x: 20, y: 100, width: 80, height: 30))
//        textField1.text = "0"
//        textField1.borderStyle = .roundedRect

        let textField1 = UITextField.init(frame: CGRect.init(x: 20, y: 100, width: 80, height: 30), placeholder: "0")

        view.addSubview(textField1)
        number1 = textField1

        let plusLabel = UITextField.init(frame: CGRect.init(x: 100, y: 100, width: 30, height: 30))
        plusLabel.font = UIFont .boldSystemFont(ofSize: 20)
        plusLabel.text = "+"
        plusLabel.sizeToFit()
        view.addSubview(plusLabel)


//        let textField2 = UITextField.init(frame: CGRect.init(x: 130, y: 100, width: 80, height: 30))
//        textField2.text = "0"
//        textField2.borderStyle = .roundedRect
        let textField2 = UITextField.init(frame: CGRect.init(x: 130, y: 100, width: 80, height: 30), placeholder: "0")

        view.addSubview(textField2)
        number2 = textField2

        let equalLabel = UILabel.init(frame: CGRect.init(x: 230, y: 100, width: 30, height: 30))
        equalLabel.text = "="
        equalLabel.sizeToFit()
        equalLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(equalLabel)

        let resultLabel1 = UILabel.init(frame: CGRect.init(x: 280, y: 100, width: 60, height: 30))
        resultLabel1.text = "0"
        resultLabel1.font = UIFont.systemFont(ofSize: 20)
        //        resultLabel1.sizeToFit()
        resultLabel1.textAlignment = .center
        view.addSubview(resultLabel1)
        resultLable = resultLabel1

//        let calculateButton = UIButton.init(type: .custom)
//
//        calculateButton.setTitle("计算", for: UIControlState.normal)
//        calculateButton.setTitleColor(UIColor.black, for: UIControlState.normal)
//        calculateButton.setTitleColor(UIColor.cyan, for: UIControlState.highlighted)

        let calculateButton = UIButton.init(title: "计算")

        calculateButton.center = view.center
        calculateButton.addTarget(self, action: #selector(calculate), for: UIControlEvents.touchUpInside)
        calculateButton.sizeToFit()
        view.addSubview(calculateButton)
        

        
    }


    func calculate() -> () {
        //        print(#function)
        //如果将不能转为Int的值强转为Int, 结果为nil
        //        let num2 = Int(number2.text ?? "")

        guard let num1 = Int(number1.text ?? ""),
            let num2 = Int(number2.text ?? "")else {
                print("请输入数字")
                return

        }
        print(num1 + num2)
        resultLable.text = "\(num1 + num2)"
        resultLable.sizeToFit()
        
        
    }
}

