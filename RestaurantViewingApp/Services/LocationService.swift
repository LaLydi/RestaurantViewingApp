//
//  LocationService.swift
//  RestaurantViewingApp
//
//  Created by Lydia Marion on 2/11/19.
//  Copyright © 2019 Lydia. All rights reserved.
//

import Foundation
import CoreLocation

enum Result<T> {
    case success(T)
    case failure(Error)
}

final class LocationService : NSObject {
    private let manager : CLLocationManager
    
    init(manager : CLLocationManager = .init()) {
        self.manager = manager
        super.init()
        manager.delegate = self
    }
    
    var newLocation : ((Result<CLLocation>) -> Void)?
    var didChangeStatus : ((Bool) -> Void)?
    
    // Returns the Location Authorization Status
    var status : CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    func requestLocationAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    func getLocation() {
        manager.requestLocation()
    }
    
}

extension LocationService : CLLocationManagerDelegate {
    // If it fails
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // If Error
        newLocation?(.failure(error))
    }
    
    // Gives us the user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // If we get a location
        if let location = locations.sorted(by: {$0.timestamp > $1.timestamp}).first {
            newLocation?(.success(location))
        }
    }
    
    // Checks the authorization
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            didChangeStatus?(false)
        default:
            didChangeStatus?(true)
        }
    }
}
