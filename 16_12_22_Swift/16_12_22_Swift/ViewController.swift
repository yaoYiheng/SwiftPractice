//
//  ViewController.swift
//  16_12_22_Swift
//
//  Created by 姚懿恒 on 2016/12/22.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.test()
        self.button.layer.cornerRadius = self.button.bounds.size.height / 2
        self.button.addTarget(self, action: #selector(printL), for: UIControlEvents.touchUpInside)
        let testColor = UIColor.init(colorLiteralRed: 213/256.0, green: 213/256.0, blue: 213/256.0, alpha: 1)

        self.button.setTitleColor(testColor, for: UIControlState.normal)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func test() {
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: 50, y: 50, width: 250, height: 50)
        button.backgroundColor = UIColor.magenta
        button.layer.cornerRadius = 25;
        button.setTitle("确定", for: UIControlState.normal)
        button.addTarget(self, action:#selector(printL), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)

    }
    func printL() {
        print("打印")
        UIView.animate(withDuration: 2) { 
//            self.button.transform = CGAffineTransform.init(scaleX: 0.2, y: 0.2)
            self.button.transform = self.button.transform.scaledBy(x: 1.1, y: 1.1)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.printL()
    }


}

