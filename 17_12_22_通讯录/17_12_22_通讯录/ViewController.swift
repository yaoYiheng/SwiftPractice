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
        accountTextField.addTarget(self, action: #selector(textChanged), for: UIControlEvents.editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged), for: UIControlEvents.editingChanged)


    }

    //点击按钮
    @IBAction func logInButton() {
        //模拟延迟

        //如果输入的账号密码正确, 才进行跳转
        if accountTextField.text == "1" && passwordTextField.text == "2" {
            performSegue(withIdentifier: "contactToList", sender: nil)
        }


        resignKeyboard()
    }


    //退出登陆
    @objc func logOut() {
        print("aaa")
    }

    //退出键盘
    func resignKeyboard() {
        view.endEditing(true)
    }

    @objc func textChanged() {

        if passwordTextField.text != "" && accountTextField.text != "" {
            loginButton.isEnabled = true
        }
        else{
            loginButton.isEnabled = false
        }
    }
}

//分类
extension ViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //退出键盘
        resignKeyboard()
    }
}


