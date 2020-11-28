//
//  ViewControllerFive.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 02.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit
import YandexMapKit
import CoreLocation

class ViewControllerFive: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    let locationManager = CLLocationManager()
    
    var lattitude: Double = 0.0
    var longitude: Double = 0.0
    
    @IBOutlet weak var mapView: YMKMapView!
    
    @IBOutlet weak var rectangleKickScooterImage: UIImageView!
    @IBOutlet weak var rectangleBicycleImage: UIImageView!
    @IBOutlet weak var rectangleScooterImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigationBar.delegate = self
        
        rectangleKickScooterImage.isHidden = true
        rectangleBicycleImage.isHidden = true
        rectangleScooterImage.isHidden = true
        //сornerView
        self.mapView.layer.cornerRadius = 20
        self.mapView.layer.masksToBounds = true
        //ASK FOR PERMISSIONS
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

        targetLocation()
    }

    func targetLocation() {
        let targetLocation = YMKPoint(latitude: 56.846401, longitude: 53.233265)

        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: targetLocation, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let locationValue : CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("My location = \(locationValue.latitude), \(locationValue.longitude)")
        lattitude = locationValue.latitude
        longitude = locationValue.longitude
    }
    @IBAction func locationAction(_ sender: Any) {
        let targetLocationNew = YMKPoint(latitude: lattitude, longitude: longitude)
        mapView.mapWindow.map.move(with: YMKCameraPosition(target: targetLocationNew, zoom: 15, azimuth: 0, tilt: 0),
        animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5), cameraCallback: nil)
    }
    @IBAction func kickScooterAction(_ sender: Any) {
        rectangleKickScooterImage.isHidden = false
        rectangleBicycleImage.isHidden = true
        rectangleScooterImage.isHidden = true
    }
    @IBAction func bicycleAction(_ sender: Any) {
        rectangleKickScooterImage.isHidden = true
        rectangleBicycleImage.isHidden = false
        rectangleScooterImage.isHidden = true
    }
    @IBAction func scooterAction(_ sender: Any) {
        rectangleKickScooterImage.isHidden = true
        rectangleBicycleImage.isHidden = true
        rectangleScooterImage.isHidden = false
    }
}

extension ViewControllerFive: NavigationBarDelegate {
    func nameSettingsButton() {
        self.performSegue(withIdentifier: "editAccountController", sender: nil)
    }
}
