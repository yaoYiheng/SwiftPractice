//
//  ViewController.swift
//  17_08_08_地理编码与反地理编码
//
//  Created by 姚懿恒 on 2017/8/8.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // 输入地址
    @IBOutlet weak var addressTextField: UITextView!
    //输入纬度
    @IBOutlet weak var latitudeTextField: UITextField!
    //输入经度
    @IBOutlet weak var longtitudeTextField: UITextField!

    private lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    /// 地理编码: 将地址转换成为经纬度
    @IBAction func geoCode() {
        guard let addressStr = addressTextField.text else {return}

        //将地址转为经纬度
        geoCoder.geocodeAddressString(addressStr) { (placeMark, error) in
            if error == nil{
                guard let realPlace = placeMark else {return}

                //placeMark是个CLPlacemark的对象的数组 一般取第一个
                let firstPlace = realPlace.first

                //将placeMark的相关属性设置到界面上
                self.addressTextField.text = firstPlace?.name

                self.latitudeTextField.text = "\((firstPlace?.location?.coordinate.latitude)!)"
                self.longtitudeTextField.text = "\((firstPlace?.location?.coordinate.longitude)!)"

            }
        }
    }
    
    /// 反地理编码: 将经纬度转换成地址
    @IBAction func reverseGeoCode() {

        let latitude = CLLocationDegrees(latitudeTextField.text!) ?? 0
        let longtitude = CLLocationDegrees(longtitudeTextField.text!) ?? 0

        let location = CLLocation(latitude: latitude, longitude: longtitude)

        /// 将经纬度转换成人熟悉的地址
        geoCoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error == nil{
                guard let realPlace = placeMark else {return}

                //placeMark是个CLPlacemark的对象的数组 一般取第一个
                let firstPlace = realPlace.first

                //将placeMark的相关属性设置到界面上
                self.addressTextField.text = firstPlace?.name

                self.latitudeTextField.text = "\((firstPlace?.location?.coordinate.latitude)!)"
                self.longtitudeTextField.text = "\((firstPlace?.location?.coordinate.longitude)!)"

            }
        }



    }


}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension ViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        let frame:CGRect = textView.frame
        let offset:CGFloat = frame.origin.y + 100 - (self.view.frame.size.height-330)

        if offset > 0  {

            self.view.frame = CGRect(x: 0.0, y: -offset, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }


    }


}
