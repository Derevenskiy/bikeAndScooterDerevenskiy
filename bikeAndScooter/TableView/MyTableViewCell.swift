//
//  MyTableViewCell.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 20.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewOut: UIImageView!
    @IBOutlet weak var labelOut: UILabel!
    @IBOutlet weak var strelkaButtonOut: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func commonInit( label: String, image: String) {
        labelOut.text = label
        imageViewOut.image = UIImage(named: image)
    }
    @IBAction func strelkaButtonAction(_ sender: Any) {
    }
}
