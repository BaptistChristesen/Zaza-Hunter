//
//  LocationManager.swift
//  Zaza Hunter
//
//  Created by caden christesen on 2/22/23.
//

import Foundation
 import CoreLocation

 class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
     var locationManager = CLLocationManager()

     override init() {
         super.init()
         locationManager.delegate = self
         locationManager.requestWhenInUseAuthorization()
         locationManager.startUpdatingLocation()
     }
 }
