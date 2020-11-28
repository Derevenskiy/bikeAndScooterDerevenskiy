//
//  ViewControllerSeven.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 17.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit
import YandexMapKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: - Outlets
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var viewMapYandex: YMKMapView!
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Array
    let arrayModel = [CardModel(title: "****2314", image: "icons8-mastercard"),CardModel(title: "PayPall", image: "icons8-paypal"),CardModel(title: "Cash", image: "icons8-cash")]
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.delegate = self
        
        cornerRadius()
        targetLocation()

        //register Cell
        let nib = UINib.init(nibName: "MyTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customTableViewCell")
    }
    //MARK: - Function
    func cornerRadius() {
        //ViewMap
        self.viewMap.layer.cornerRadius = 10
        self.viewMap.layer.masksToBounds = true
        //viewMapYandex
        self.viewMapYandex.layer.cornerRadius = 15
        self.viewMapYandex.layer.masksToBounds = true
    }
    func targetLocation() {
        let targetLocation = YMKPoint(latitude: 56.846401, longitude: 53.233265)
        viewMapYandex.mapWindow.map.move(
            with: YMKCameraPosition(target: targetLocation, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }
    //MARK: - IBAction
    @IBAction func showSpeak(_ sender: Any) {
        print("speak")
    }
}
//MARK: - NavigationBarDelegate
extension SettingsViewController: NavigationBarDelegate {
    func nameSettingsButton() {
        self.performSegue(withIdentifier: "editAccountControllerTwo", sender: nil)
    }
}
//MARK: - Extension SettingsViewController
extension SettingsViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? MyTableViewCell
        cell?.commonInit(label: arrayModel[indexPath.row].title!, image: arrayModel[indexPath.row].image!)
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("Card")
        } else if indexPath.row == 1 {
            print("Paypal")
        } else {
            print("Coopon")
        }
    }
}
