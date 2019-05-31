//
//  ViewController.swift
//  TagalongTrial
//
//  Created by Kieran Bondy on 5/9/19.
//  Copyright © 2019 Kieran Bondy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Profbtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = storyBoard.instantiateViewController(withIdentifier: "ProfilePage")
        self.present(Home, animated: false, completion: nil)
    }
    @IBAction func Friendsbtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = storyBoard.instantiateViewController(withIdentifier: "FriendsPage")
        self.present(Home, animated: false, completion: nil)
        
    }
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            MapView.setRegion(region, animated: true)
        }
    }
    
    func addPin(lat: Double, long: Double){
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        MapView.addAnnotation(annotation1)
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            
        }
    }



func checkLocationAuthorization() {
    switch CLLocationManager.authorizationStatus() {
    case .authorizedWhenInUse:
        break
    case .denied:
        break
    case .notDetermined:
        locationManager.requestAlwaysAuthorization()
    case .restricted:
        break
    case .authorizedAlways:
        MapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        break
    @unknown default:
        break
        
    }
}
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        MapView.setRegion(region, animated: true)
        print("locations = \(locations)")
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}
