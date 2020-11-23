//
//  ViewControllerNine.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 22.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class ViewControllerNine: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let arrayModel = [CardModel(title:"Credit or Debit Card",image: UIImage(named: "cardImageAddPayment")!), CardModel(title:"PayPal",image: UIImage(named: "payPallImageAddPayment")!), CardModel(title:"Coupon",image: UIImage(named: "cooponImageAddPayment")!)]

    private var alertView: AlertCustom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "TableViewCellAddPayment", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customTableViewCellAddPayment")
        
        
    }
    
    @IBAction func backToAccount(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setAlert() {
        alertView = Bundle.main.loadNibNamed("AlertCustom", owner: self, options: nil)?.first as? AlertCustom
        
        self.view.addSubview(alertView)
        alertView.center = self.view.center
        
        alertView.cancelOut.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
    }
    
    @objc func cancelAction() {
        //view.didAddSubview(alertView)
        //view.willRemoveSubview(alertView)
        alertView.removeFromSuperview()
        print("проверка")
        
    }
    
    
}

extension ViewControllerNine {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCellAddPayment", for: indexPath) as? TableViewCellAddPayment
        
        cell?.commonInit(title: arrayModel[indexPath.row].title, image: arrayModel[indexPath.row].image)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "addCard", sender: nil)
        } else if indexPath.row == 1 {
            print("Paypal")
        } else {
            setAlert()
        }
    }
    
}
