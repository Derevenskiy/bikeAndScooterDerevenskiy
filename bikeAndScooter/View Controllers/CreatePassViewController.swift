//
//  ViewControllerFour.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 18.10.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class CreatePassViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var eyeButtonOutlet: UIButton!
    @IBOutlet weak var buttonOutlet: UIButton!
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        passTextField.addTarget(self, action: #selector(checkPass(sender:)), for: .editingChanged)
        buttonOutlet.isEnabled = false
    }
    //MARK: - Function
    @objc func checkPass(sender: UITextField) {
        let text = sender.text
        let textCount = text?.characters.count
        if textCount! < 5 {
            buttonOutlet.isEnabled = false
        } else {
            buttonOutlet.isEnabled = true
        }
    }
    //MARK: - IBAction
    @IBAction func eyeButton(_ sender: Any) {
        switch passTextField.isSecureTextEntry {
        case true:
            passTextField.isSecureTextEntry = false
            eyeButtonOutlet.setImage(UIImage(named: "passVisibleOn"), for: .normal)
        case false:
            passTextField.isSecureTextEntry = true
            eyeButtonOutlet.setImage(UIImage(named: "passVisible"), for: .normal)
        }
    }
}
