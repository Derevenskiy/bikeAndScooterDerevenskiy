//
//  ViewControllerEight.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 17.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController {

    // MARK: - IBAction
    @IBAction func goBackToHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
