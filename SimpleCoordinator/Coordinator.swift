//
//  Coordinator.swift
//  SimpleCoordinator
//
//  Created by Gabriel Cavalcante on 28/01/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var chieldCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
