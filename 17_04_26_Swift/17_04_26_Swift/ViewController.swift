//
//  ViewController.swift
//  17_04_26_Swift
//
//  Created by 姚懿恒 on 2017/4/26.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    //MARK: -生命
    override func viewDidLoad() {
        super.viewDidLoad()

        let myView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 100))
        myView.backgroundColor = #colorLiteral(red: 0.9569372535, green: 0.2282762229, blue: 0.07075651735, alpha: 1)   //FIXME: change the Color
        view.addSubview(myView)

        let imageView = UIImageView.init(image: #imageLiteral(resourceName: "Gin_1.jpeg")) //TODO: 修改图片
        imageView.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)

        view.addSubview(imageView)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

