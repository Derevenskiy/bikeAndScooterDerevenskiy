//
//  TableViewCellAddPayment.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 22.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class TableViewCellAddPayment: UITableViewCell {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func commonInit(title: String, image: String) {
        titleLabel.text = title
        cardImage.image = UIImage(named: image)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
