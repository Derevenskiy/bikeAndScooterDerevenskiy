//
//  ViewControllerSeven.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 17.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit
import YandexMapKit

class ViewControllerSeven: UIViewController {
    
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var viewMapYandex: YMKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewMap.layer.cornerRadius = 10
        self.viewMap.layer.masksToBounds = true
        
        
        
        customNavigationBar.delegate = self
        
        self.viewMapYandex.layer.cornerRadius = 15
        self.viewMapYandex.layer.masksToBounds = true
        
        let targetLocation = YMKPoint(latitude: 56.846401, longitude: 53.233265)
        
        viewMapYandex.mapWindow.map.move(
            with: YMKCameraPosition(target: targetLocation, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }
    
}

extension ViewControllerSeven: NavigationBarDelegate {
    func nameSettingsButton() {
        self.performSegue(withIdentifier: "editAccountControllerTwo", sender: nil)
    }
}
