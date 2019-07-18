//
//  ViewController.swift
//  locations_and_map
//
//  Created by Jagmeet Kaur on 2019-07-18.
//  Copyright © 2019 Jagmeet Kaur. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    
    @IBOutlet var mapView: MKMapView!
    
    
    @IBOutlet weak var myTextView: UITextView!
    
    let locationManager = CLLocationManager()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

       mapView.delegate = self
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.last {
            let latitudeString = "\(newLocation.coordinate.latitude)"
            let longitudeString = "\(newLocation.coordinate.longitude)"
            myTextView.text = "Latitude: " + latitudeString + "\nLongitude: " + longitudeString
        }
    }

   func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let zoomArea = MKCoordinateRegion(center: self.mapView.userLocation.coordinate, span:
                MKCoordinateSpan (latitudeDelta: 0.05, longitudeDelta: 0.05))
    self.mapView.setRegion(zoomArea, animated: true)
        }

        
        
        
        
}


