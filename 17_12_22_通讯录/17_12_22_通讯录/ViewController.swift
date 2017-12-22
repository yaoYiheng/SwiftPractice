//
//  ViewController.swift
//  17_12_22_通讯录
//
//  Created by 姚懿恒 on 2017/12/22.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var keepPasswordSwitch: UISwitch!
    
    @IBOutlet weak var autoLoginSwitch: UISwitch!

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //点击按钮
    @IBAction func logInButton() {

        resignKeyboard()
    }


    //退出键盘
    func resignKeyboard() {
        view.endEditing(true)
    }
}

//分类
extension ViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //退出键盘
        resignKeyboard()
    }
}

