//
//  NavigationBar.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 15.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

@objc protocol NavigationBarDelegate: class {
    @objc optional func nameSettingsButton()
}

@IBDesignable
class NavigationBar: UIView {
    weak var delegate: NavigationBarDelegate?
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var moneyLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        let bundle = Bundle(for: NavigationBar.self)
        bundle.loadNibNamed("NavigationBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    @IBAction func nameSettingsAction(_ sender: Any) {
        delegate?.nameSettingsButton?()
    }
    @IBAction func promoCodeButton(_ sender: Any) {
    }
}
