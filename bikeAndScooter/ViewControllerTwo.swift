//
//  ViewControllerTwo.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 27.08.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var ovalOutletButton: UIButton!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        ovalOutletButton.becomeFirstResponder()
        
        //NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            //self.ovalOutletButton.frame.origin.y = -0.1
        //}
        
    }
    
    @IBAction func buttonOval(_ sender: Any) {
        //performSegue(withIdentifier: "three", sender: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
