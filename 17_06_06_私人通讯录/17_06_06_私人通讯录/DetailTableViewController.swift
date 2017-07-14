//
//  DetailTableViewController.swift
//  17_06_06_私人通讯录
//
//  Created by 姚懿恒 on 2017/6/6.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!

    /// Class 'DetailTableViewController' has no initializers
//    var completion: ()->()

    //回调属性
    var completionCallBack: (() -> ())?


    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        //如果person有值就设置到UI界面上
        if let realPerspn = person {
            nameTextField.text = realPerspn.name
            phoneTextField.text = realPerspn.phone
            titleTextField.text = realPerspn.title
        }

    }

    //从UI更新数据, 保存并返回
    @IBAction func savePerson(_ sender: Any) {

        //如果person为空, 就是新建一个person
        if person == nil {
            person = Person()
        }
        person?.name = nameTextField.text
        person?.phone = phoneTextField.text
        person?.title = titleTextField.text


        //执行闭包
        completionCallBack?()

        //navigationController 调用该方法会有一个返回值, 而用不上的值, 都可以使用'_'下划线进行忽略
        _ = navigationController?.popViewController(animated: true)
    }
    // MARK: - Table view data source
}
