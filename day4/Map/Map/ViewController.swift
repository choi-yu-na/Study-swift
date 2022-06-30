//
//  ViewController.swift
//  Map
//
//  Created by Dongduk3 on 2022/06/27.
//

import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet var myMap: MKMapView!

    
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        
        locationManager.delegate=self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation=true
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            
            locationManager.startUpdatingLocation()
            
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.6068163, longtitudeValue: 127.0423832, delta: 1, title: "동덕여자대학교", subtitle: "서울특별시 성북구 화랑로13길 60")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "동덕여자대학교"
            
        } else if sender.selectedSegmentIndex == 2 { //내 집 주소
            setAnnotation(latitudeValue: 37.5939286, longtitudeValue: 127.0879792, delta: 1, title: "내 집", subtitle: "서울특별시 중랑구 봉우재로33길 34")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "내 집"
            
        }
        
        
    }
    
    func goLocation(latitiudeValue : CLLocationDegrees,
                    longitudeValue : CLLocationDegrees,
                    delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitiudeValue, longitudeValue)
        
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longtitudeValue:CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitiudeValue: latitudeValue, longitudeValue: longtitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        
        myMap.addAnnotation(annotation)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        
        goLocation(latitiudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country  = pm!.country
            var address:String = country!
            
            if pm!.locality != nil {
                
                address += " "
                address += pm!.locality!
            }
            
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
            
        })
        
        locationManager.stopUpdatingLocation()
    }
}

