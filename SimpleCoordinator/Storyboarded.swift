//
//  Storyboarded.swift
//  SimpleCoordinator
//
//  Created by Gabriel Cavalcante on 28/01/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(with name: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(with name: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
