//
//  UITextField+extention.swift
//  17_06_05_便利构造函数
//
//  Created by 姚懿恒 on 2017/6/5.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

extension UITextField{

    convenience init(frame: CGRect, placeholder: String, fontSize: CGFloat = 13) {

        self.init(frame: frame)

        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.font = UIFont.systemFont(ofSize: fontSize)

    }
}
