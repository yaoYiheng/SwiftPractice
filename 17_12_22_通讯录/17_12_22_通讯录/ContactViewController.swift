//
//  ContactViewController.swift
//  17_12_22_通讯录
//
//  Created by 姚懿恒 on 2017/12/30.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ContactViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let leftNavButton = UIBarButtonItem.init(title: "注销", style: .done, target: self, action: #selector(logOut))
        navigationItem.leftBarButtonItem = leftNavButton
    }

    @objc func logOut() {

        //在屏幕中间
        let alert = UIAlertController.init(title: "确定注销吗?", message: nil, preferredStyle: .alert)

        //在屏幕底部
//        let alert = UIAlertController.init(title: "确定注销吗?", message: nil, preferredStyle: .alert)

        let confirmAction = UIAlertAction.init(title: "注销", style: .destructive) { (alert) in
            self.navigationController?.popViewController(animated: true)
        }

        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)

        alert.addAction(confirmAction)
        alert.addAction(cancelAction)

        self.present(alert, animated: true, completion: nil)


    }


}
