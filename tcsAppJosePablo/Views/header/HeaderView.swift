//
//  HeaderView.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import UIKit
import CoreLocation

class HeaderView: UIView, CLLocationManagerDelegate {

    @IBOutlet weak var coordinates: UILabel!
    @IBOutlet weak var userTxtfield: UILabel!
    let locationManager = CLLocationManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("header", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)

        let userName = UserDefaults.standard.string(forKey: "username")
        userTxtfield.text = userName
        
       locationManager.requestAlwaysAuthorization()
       if CLLocationManager.locationServicesEnabled() {
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyBest
           locationManager.startUpdatingLocation()
       }
    }
    
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            coordinates.text = "Coordinates : Latitude \(location.coordinate.latitude) - Longitude \(location.coordinate.longitude)"
            
           }
           
       }
}
