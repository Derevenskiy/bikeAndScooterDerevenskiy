//
//  AlertViewController.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 26.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
