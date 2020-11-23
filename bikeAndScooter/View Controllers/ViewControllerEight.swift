//
//  ViewControllerEight.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 17.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class ViewControllerEight: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func editImageButton(_ sender: Any) {
        print("start edit image")
    }
    
    @IBAction func goBackToHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
