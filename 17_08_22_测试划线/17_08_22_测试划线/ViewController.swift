//
//  ViewController.swift
//  17_08_22_测试划线
//
//  Created by 姚懿恒 on 2017/8/22.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    /// 用来记录上一次的位置
    var lastPositon: CLLocation?
    var mapView: MKMapView!
    var overlay: Array<MKOverlay>!

    //位置数组
    var lineCoordinates: [CLLocationCoordinate2D] = []

    lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()

    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()

        locationManager.requestAlwaysAuthorization()

        //设置位置管理者的代理
        locationManager.delegate = self
//        locationManager.distanceFilter = 10


        return locationManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = locationManager
        initMapView()
        addGlass()
    }

    private func initMapView() {
        mapView = MKMapView()
        mapView.delegate = self
        mapView.frame = view.bounds
        mapView.mapType = .hybrid

        mapView.userTrackingMode = .follow
//        mapView.showsUserLocation = true
        view.addSubview(mapView)
    }

    /// 添加毛玻璃
    private func addGlass() {
        let toolBar = UIToolbar.init(frame: view.bounds)

        toolBar.barStyle = .black
        toolBar.backgroundColor = UIColor.darkGray
        toolBar.alpha = 0.7
        toolBar.isUserInteractionEnabled = false

        view.addSubview(toolBar)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        locationManager.startUpdatingLocation()


//        var lineCoordinates: [CLLocationCoordinate2D] = [
//            CLLocationCoordinate2D(latitude: 39.855539, longitude: 116.119037),
//            CLLocationCoordinate2D(latitude: 39.88539, longitude: 116.250285),
//            CLLocationCoordinate2D(latitude: 39.805479, longitude: 116.180859),
//            CLLocationCoordinate2D(latitude: 39.788467, longitude: 116.226786),
//            CLLocationCoordinate2D(latitude: 40.001442, longitude: 116.353915),
//            CLLocationCoordinate2D(latitude: 39.989105, longitude: 116.360200)]
//
//        let line = MKPolyline(coordinates: &lineCoordinates, count: lineCoordinates.count)
//
//
//
//        mapView.add(line)
    }
}


// MARK: - <#CLLocationManagerDelegate#>
extension ViewController: CLLocationManagerDelegate{

    func madeLine(lastlocation: CLLocation) -> Void {

        lineCoordinates.append(lastlocation.coordinate)

        let line = MKPolyline(coordinates: &lineCoordinates, count: lineCoordinates.count)



        mapView.add(line)
    }

    private func addAnnotation(_ coordinate: CLLocationCoordinate2D, title: String, subTitle:String) -> YHAnnotation{
        //1. 创建大头针对象
        let annotation = YHAnnotation()

        //2. 赋值相关属性
            annotation.coordinate = coordinate
            annotation.title = title
            annotation.subtitle = subTitle
        //3. 添加到地图
        mapView.addAnnotation(annotation)

        return annotation
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastlocation = locations.first else {return}
        if lastlocation.horizontalAccuracy < 0 {return}



        let annotation = addAnnotation(lastlocation.coordinate, title: "", subTitle: "")

            //使用反地理编码, 将经纬度坐标转换成地址, 懒加载创建geoCoder
            geoCoder.reverseGeocodeLocation(lastlocation) { (placeMark, error) in
                if error == nil{
                    let placeM = placeMark?.first

                    annotation.title = placeM?.administrativeArea
                    annotation.subtitle = placeM?.name

                }
            }

//        lastPositon = lastlocation
//        print(location)

//        geoCoder.reverseGeocodeLocation(lastlocation) { (placeMarks, error) in
//            if error == nil{
//                print(lastlocation)
//                //1.1获取地标
//                let placeMark = placeMarks?.last
//
//                //2.转换类型
//                let mkPlaceMark = MKPlacemark(placemark: placeMark!)
//
//                let mapItem = MKMapItem(placemark: mkPlaceMark)
//
//                //4.获取起点的mapItem
//                let currentMapItem = MKMapItem.forCurrentLocation()
//
//
//                //5.创建请求对象
//                let request = MKDirectionsRequest()
//
////                MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
//                //目的地
//                request.destination = mapItem;
//                //起点
//                request.source = currentMapItem;
//                //6.创建方向对象
//                let directions = MKDirections(request: request)
//
//                directions.calculate(completionHandler: { (response, error) in
//                    if error == nil {
//
//                        let routes = response?.routes
//
//                        for route in routes! {
//
//
//                        self.mapView.add(route.polyline)
//                        }
//                    }
//                })
//
//            }
//        }


    }


}
// MARK: - <#MKMapViewDelegate#>
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let identifier = "item"

        //循环利用
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        //赋值
        annotationView?.annotation = annotation

        //将雾以大头针的方式添加l
        let image = UIImage(named: "fog")

        annotationView?.image = image


        return annotationView


    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {    // 创建折线渲染对象
//        if ([overlay isKindOfClass:[MKPolyline class]]) {
//
//            MKPolylineRenderer *lineRenderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
//            // 设置线宽
//            lineRenderer.lineWidth = 6;
//            // 设置线颜色
//            lineRenderer.strokeColor = [UIColor redColor];
//            return lineRenderer;
//        }

        var resultRender = MKOverlayRenderer()

        if overlay.isKind(of: MKPolyline.self) {

            // 不同的覆盖层数据模型, 对应不同的覆盖层视图来显示
            let render: MKPolylineRenderer = MKPolylineRenderer(overlay: overlay)

            // 设置线宽
            render.lineWidth = 13
            // 设置颜色
            render.strokeColor = UIColor.red

            resultRender = render

        }





        return resultRender


    }


}

