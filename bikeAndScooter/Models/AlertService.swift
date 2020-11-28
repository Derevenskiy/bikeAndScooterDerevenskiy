//
//  AlertService.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 26.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class AlertService {

    func alert() -> AlertViewController {
        let storyboard = UIStoryboard(name: "AlertStoryboard", bundle: nil)
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewController

        return alertVC
    }
}
