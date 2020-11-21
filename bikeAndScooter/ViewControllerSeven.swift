//
//  ViewControllerSeven.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 17.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit
import YandexMapKit

class ViewControllerSeven: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var viewMapYandex: YMKMapView!
    
   
    @IBOutlet weak var tableView: UITableView!
    //labelArr
    var imageArray = ["icons8-mastercard", "icons8-paypal", "icons8-cash"]
    var labelArray = ["****2314", "PayPall", "Cash"]
    
    
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
        
        //register Cell
        let nib = UINib.init(nibName: "MyTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customTableViewCell")
        
    }
    
    @IBAction func showSpeak(_ sender: Any) {
        print("speak")
    }
    
    
}

extension ViewControllerSeven: NavigationBarDelegate {
    func nameSettingsButton() {
        self.performSegue(withIdentifier: "editAccountControllerTwo", sender: nil)
    }
}

extension ViewControllerSeven {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? MyTableViewCell
        cell?.commonInit(labelArray[indexPath.row], imageArray[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(imageArray)")
    }
    
}
