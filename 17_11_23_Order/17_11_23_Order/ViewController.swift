//
//  ViewController.swift
//  17_11_23_Order
//
//  Created by 姚懿恒 on 2017/11/23.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var dishesLabel: UILabel!
    @IBOutlet weak var liquidLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    lazy var food: [Array<Any>] = {
        //从Bundle中加载plist文件
        let path = Bundle.main.path(forResource: "Food.plist", ofType: nil)

        return NSArray.init(contentsOfFile: path!) as! [Array<Any>]
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSelect()
    }

    //监听按钮点击
    @IBAction func randomOrder() {

        for index in 0..<food.count {
            //取出第index组中的数组的个数
            let each = food[index].count
            //在根据个数随机选择
            var randomIndex = arc4random_uniform(UInt32(each))

            //如果生成的随机数与当前显示的一致, 则需要重新生成一个不同的随机数
            //获取当前选中的
            let selectedRow = pickerView(pickerView, numberOfRowsInComponent: index)

            //如果随机数等于当前行数, 则重新生成
            print("randomIndex == \(randomIndex)")

            while (selectedRow == randomIndex){
                randomIndex = arc4random_uniform(UInt32(each))
                
            }

            //给pickerView传入数值
            pickerView.selectRow(Int(randomIndex), inComponent: index, animated: true)

            //将数据显示到Label上
            pickerView(pickerView, didSelectRow: Int(randomIndex), inComponent: index)

        }

    }
    
    private func defaultSelect(){
        for index in 0..<food.count {

            pickerView(pickerView, didSelectRow: 0, inComponent: index)
        }
    }


}

//在类扩展中实现代理与数据源方法
extension ViewController: UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return food.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let comArray = food[component]
        return comArray.count

    }

    //代理方法, 当选中到某一组的某一行时会调用该方法
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selFood = food[component][row] as? String

        switch component {
        case 0:
            fruitLabel.text = selFood
        case 1:
            dishesLabel.text = selFood
        case 2:
            liquidLabel.text = selFood
        default:
            break
        }
    }

}
extension ViewController: UIPickerViewDataSource{

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let comArray = food[component]
        return comArray[row] as? String

    }

}

