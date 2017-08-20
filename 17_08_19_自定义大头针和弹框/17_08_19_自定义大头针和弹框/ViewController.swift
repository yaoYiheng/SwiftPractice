//
//  ViewController.swift
//  17_08_19_自定义大头针和弹框
//
//  Created by 姚懿恒 on 2017/8/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!


    private lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    ///点击后添加大头针
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //获取点
        guard let point = touches.first?.location(in: mapView) else {return}
        //将点转化成经纬度
        let coordinate: CLLocationCoordinate2D = mapView.convert(point, toCoordinateFrom: mapView)
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        let annotation = addAnnotation(coordinate, title: "未知", subTitle: "未知")

        //使用反地理编码, 将经纬度坐标转换成地址, 懒加载创建geoCoder
        geoCoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error == nil{
                let placeM = placeMark?.first

                annotation.title = placeM?.administrativeArea
                annotation.subtitle = placeM?.name

            }
        }

    }

    private func addAnnotation(_ coordinate: CLLocationCoordinate2D, title: String, subTitle:String) -> YHAnnotation{

        //创建annotation对象
        let annotation = YHAnnotation()
        //为相关属性赋值
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subTitle

        //添加大头针数据模型到地图
        mapView.addAnnotation(annotation)

        return annotation

    }

}
extension ViewController: MKMapViewDelegate{
    /// 返回大头针视图
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let identifier = "item"

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }

        //修改大头针颜色
        annotationView?.pinTintColor = UIColor.purple
        //允许动画下落
        annotationView?.animatesDrop = true
        //弹框
        annotationView?.canShowCallout = true
        

        return annotationView
    }
}

