//
//  ViewController.swift
//  ibeacon-3tech
//
//  Created by heart on 2/24/2560 BE.
//  Copyright © 2560 3dsinteractive.com. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        
        let uuid = UUID(uuidString:"B558CBDA-4472-4211-A350-FF1196FFE8C8")
        
        let beacon = CLBeaconRegion(proximityUUID: uuid,
                                          major: nil,
                                          minor: nil,
                                          identifier:"my room")
        
        locationManager.startMonitoring(for: beacon )
        
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
        if (region as? CLBeaconRegion) != nil {
            let notification = UILocalNotification()
            notification.alertBody = "Yes you found iBeacon?"
            
            UIApplication.shared.presentLocalNotificationNow(notification)
        }
        
    }

}

