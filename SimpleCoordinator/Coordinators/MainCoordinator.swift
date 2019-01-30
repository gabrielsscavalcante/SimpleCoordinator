//
//  MainCoordinator.swift
//  SimpleCoordinator
//
//  Created by Gabriel Cavalcante on 28/01/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var chieldCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate(with: StoryboardID.main)
        vc.coordinator = self
        navigationController.viewControllers = [vc]
    }
    
    func buySubscription() {
        let vc = BuyViewController.instantiate(with: StoryboardID.main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate(with: StoryboardID.main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
