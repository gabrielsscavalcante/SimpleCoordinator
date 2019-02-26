//
//  BuyCoordinator.swift
//  SimpleCoordinator
//
//  Created by Gabriel Cavalcante on 25/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BuyViewController.instantiate(with: StoryboardID.main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishBuying() {
        parentCoordinator?.chieldDidFinish(self)
    }
}
