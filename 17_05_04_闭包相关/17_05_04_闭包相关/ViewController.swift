//
//  ViewController.swift
//  17_05_04_闭包相关
//
//  Created by 姚懿恒 on 2017/5/4.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number1 = UITextField()
    var number2 = UITextField()
    var resultLable = UILabel()



    var compltionCallBack: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()


//
//        demo { (array) in
//            print(array)
//        }

//        loadData { (dict) in
//            print(dict)
//            if let value = dict["age"]{
//                print(value)
//            }
//
//        }

        /*
         循环引用 单方面的引用是不会造成循环引用的
         */
        // 这种情况不会出现循环引用, 只是闭包对self进行了copy, 闭包执行结束后, 会自动销户, 同时释放对self的引用
        // 如果想要实现循环引用, 需要同时也实现 self 对闭包的引用, 在self中添加一个属性

        /*使用weak修饰的变量必须是可变的, 因为可能会在运行时被修改
         'weak' must be a mutable variable, because it may change at runtime
         */

        //解除循环引用方式1:

//        weak var weakSelf = self
//        cycle { 
//            print(weakSelf!.view)
//        }

        //解除方法2: Swift 推荐做法 [weak self] in
//        cycle { [weak self] in
//
//            if let weakSelf = self{
//                print(weakSelf.view)
//            }
//
//        }

        //解除方法3:[unowned self]表示{}中的所有的self 都是assign, 不会造成强引用, 但是如果对象释放, self仍指向原因的地址, 不会像weak一样指向nil, 这样会造成野指针错误
//        cycle { [unowned self] in
//            print(self.view)
//        }

        setupUI()


    }

    func setupUI() -> () {
        let textField1 = UITextField.init(frame: CGRect.init(x: 20, y: 100, width: 80, height: 30))
        textField1.text = "0"
        textField1.borderStyle = .roundedRect
        view.addSubview(textField1)
        number1 = textField1

        let plusLabel = UITextField.init(frame: CGRect.init(x: 100, y: 100, width: 30, height: 30))
        plusLabel.font = UIFont .boldSystemFont(ofSize: 20)
        plusLabel.text = "+"
        plusLabel.sizeToFit()
        view.addSubview(plusLabel)


        let textField2 = UITextField.init(frame: CGRect.init(x: 130, y: 100, width: 80, height: 30))
        textField2.text = "0"
        textField2.borderStyle = .roundedRect
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

        let calculateButton = UIButton.init(type: .custom)
        calculateButton.center = view.center
        calculateButton.setTitle("计算", for: UIControlState.normal)
        calculateButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        calculateButton.setTitleColor(UIColor.cyan, for: UIControlState.highlighted)
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
    deinit {
        print("控制器挂掉")

    }

    //MARK: -循环引用
    func cycle(completion: @escaping () -> ()) -> () {

        //使用属性记录闭包, self也引用了闭包
        compltionCallBack = completion

        DispatchQueue.global().async {
            print("耗时操作")

            DispatchQueue.main.async {
                completion()
            }
        }
    }

    /// 在异步执行任务, 获取结果后, 通过block/闭包 回调
    /*
        闭包的应用场景和block完全一样
     完成, 即拿到结果后, 要做的事情, 也是一段代码, 这段代码是否需要参数来继续执行, 
     也就是相当于, 把拿到结果后的那段代码, 根据他需要的参数与返回值, 定义为一个函数
     
     不再允许函数的参数的标签出现
     */

    func loadData(completion: @escaping (_ result: [String: Any]) -> ()) -> () {
        DispatchQueue.global().async { 
            print("耗时操作")


            Thread.sleep(forTimeInterval: 2)

            let dict : [String: Any] = ["Name": "zhangsan", "age": 12];

            DispatchQueue.main.async(execute: { 
                completion(dict)
            })
        }
    }

    func demo(completion: @escaping (_ result: [String]) -> ()) -> () {
        DispatchQueue.global().async { 
            Thread.sleep(forTimeInterval: 2)

            let array = ["头条", "娱乐", "新闻"]

            //尾随闭包: 
            DispatchQueue.main.async {
                completion(array)
            }
        }
    }
}

import Foundation

extension NSDictionary{
    //如果replacer是nil,则会删除所有的null;如果是字符串，则会将所有的null值替换为这个字符串
    func replaceAllNullValueWithString(replacer:String?)-> NSDictionary{
        func replaceNullValueInObject(obj:AnyObject,withString replacer:String?)->AnyObject{//嵌套函数，递归
            if obj is NSDictionary {//如果是字典
                let dict = obj as! NSDictionary
                let mDict = NSMutableDictionary(dictionary: dict)
                for (key,value) in dict {
                    if value is NSNull {
                        mDict[key as! String] = replacer
                    } else if (value is NSArray)||(value is NSDictionary) {//字典套数组
                        mDict[key as! String] = replaceNullValueInObject(obj: value as AnyObject,withString: replacer)
                    }
                }
                return mDict
            } else if obj is NSArray {
                let arr = obj as! NSArray
                let mArr = NSMutableArray()
                for value in arr {
                    if (value is NSDictionary)||(value is NSArray) {//数组套字典,或者数组套数组
                        mArr.add(replaceNullValueInObject(obj: value as AnyObject,withString: replacer))
                    } else if value is NSNull {
                        if replacer != nil {
                            mArr.add(replacer!)
                        }
                    } else {
                        mArr.add(value)
                    }
                }
                return mArr
            }
            return obj
        }

        return replaceNullValueInObject(obj: self,withString: replacer) as! NSDictionary
    }
}
