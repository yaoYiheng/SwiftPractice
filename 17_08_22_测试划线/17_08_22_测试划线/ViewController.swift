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


    lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()

    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()

        locationManager.requestAlwaysAuthorization()

        //设置位置管理者的代理
        locationManager.delegate = self


        return locationManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = locationManager
        initMapView()
    }

    private func initMapView() {
        mapView = MKMapView()
        mapView.delegate = self
        mapView.frame = view.bounds
        mapView.mapType = .standard

        mapView.userTrackingMode = .follow
//        mapView.showsUserLocation = true
        view.addSubview(mapView)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        locationManager.startUpdatingLocation()
    }
}


// MARK: - <#CLLocationManagerDelegate#>
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastlocation = locations.first else {return}
        if lastlocation.horizontalAccuracy < 0 {return}

        lastPositon = lastlocation
//        print(location)

        geoCoder.reverseGeocodeLocation(lastlocation) { (placeMarks, error) in
            if error == nil{
                print(lastlocation)
                //1.1获取地标
                let placeMark = placeMarks?.last

                //2.转换类型
                let mkPlaceMark = MKPlacemark(placemark: placeMark!)

                let mapItem = MKMapItem(placemark: mkPlaceMark)

                //4.获取起点的mapItem
                let currentMapItem = MKMapItem.forCurrentLocation()


                //5.创建请求对象
                let request = MKDirectionsRequest()

//                MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
                //目的地
                request.destination = mapItem;
                //起点
                request.source = currentMapItem;
                //6.创建方向对象
                let directions = MKDirections(request: request)

                directions.calculate(completionHandler: { (response, error) in
                    if error == nil {

                        let routes = response?.routes

                        for route in routes! {

                            // MKRoute


//                            print(route.name, route.distance, route.expectedTravelTime)

                            // 添加覆盖层数据模型
                            // 当我们添加一个覆盖层数据模型时, 系统绘自动查找对应的代理方法, 找到对应的覆盖层"视图"

                        self.mapView.add(route.polyline)
                        }
                    }
                })
//                MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
                //6.1向苹果请求数据,获取路线
//                [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
//                if(error){
//                NSLog(@"%@",error);
//                return ;
//                }
//                //遍历数组,获取所有折线
//                for (MKRoute *route in response.routes) {
//                //获取折线
//                MKPolyline *polyline = route.polyline;
//                //将折线添加到地图上
//                [self.mapVIew addOverlay:polyline];
//                }
//
            }
        }


    }


}
// MARK: - <#MKMapViewDelegate#>
extension ViewController: MKMapViewDelegate{

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
            render.lineWidth = 6
            // 设置颜色
            render.strokeColor = UIColor.red

            resultRender = render

        }





        return resultRender


    }


}

