//
//  ViewControllerNine.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 22.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class AddPaymentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Array
    let arrayModel = [CardModel(title: "Credit or Debit Card", image: "cardImageAddPayment"),
                      CardModel(title: "PayPal", image: "payPallImageAddPayment"),
                      CardModel(title: "Coupon", image: "cooponImageAddPayment")]

    // MARK: - alertService
    let alertService = AlertService()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib.init(nibName: "TableViewCellAddPayment", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customTableViewCellAddPayment")
    }

    // MARK: - IBAction
    @IBAction func backToAccount(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDataSource
extension AddPaymentViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCellAddPayment", for: indexPath) as? TableViewCellAddPayment

        cell?.commonInit(title: arrayModel[indexPath.row].title!, image: arrayModel[indexPath.row].image!)
        return cell!
    }
// MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "addCard", sender: nil)
        } else if indexPath.row == 1 {
            print("Paypal")
        } else {
            let alertVC = alertService.alert()
            present(alertVC, animated: true)
        }
    }
}
