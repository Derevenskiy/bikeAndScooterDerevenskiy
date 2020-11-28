//
//  ViewControllerThree.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 14.10.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class CreateEmailViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var textEmail: UITextField!
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        textEmail.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

        buttonOutlet.isEnabled = false
    }
    //MARK: - Function
    @objc func textFieldDidChange(textField: UITextField) {
        if textEmail.text!.isValidEmail() {
            buttonOutlet.isEnabled = true
        } else {
            buttonOutlet.isEnabled = false
            print("Некорректный e-mail")
        }
    }
}
