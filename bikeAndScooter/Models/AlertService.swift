//
//  AlertService.swift
//  bikeAndScooter
//
//  Created by Артем Чернышов on 26.11.2020.
//  Copyright © 2020 Artem Chernyshov. All rights reserved.
//

import UIKit

class AlertService {
    func alert() -> AlertViewController {
        return AlertViewController.makeViewController()
    }
}
// новая фича
protocol StoryboardLoadable {
    static var storyboardName: String {get}
}

extension StoryboardLoadable where Self: UIViewController {

    private static func makeStoryboard() -> UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }

    static func makeViewController() -> Self {
        return (makeStoryboard().instantiateViewController(withIdentifier: String(describing: Self.self)) as? Self)!
    }
}

extension AlertViewController: StoryboardLoadable {
    static var storyboardName: String {
       return "AlertStoryboard"
    }
}
