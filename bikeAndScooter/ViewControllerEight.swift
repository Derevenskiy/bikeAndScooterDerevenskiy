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
    @IBAction func goBackToHome(_ sender: Any) {
        
        //self.dismiss(animated: true, completion: {});
        self.navigationController?.popToRootViewController(animated: true)
        
        //let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
    }
    
}
