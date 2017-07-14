//
//  UIButton+extention.swift
//  17_06_05_便利构造函数
//
//  Created by 姚懿恒 on 2017/6/6.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

extension UIButton{
    convenience init(title: String, color: UIColor = UIColor.red, highlightedColor: UIColor = UIColor.brown){

        self.init()

        self.setTitle(title, for: UIControlState.normal)
        self.setTitleColor(color, for: UIControlState.normal)
        self.setTitleColor(highlightedColor, for: UIControlState.highlighted)
        
    }
}
