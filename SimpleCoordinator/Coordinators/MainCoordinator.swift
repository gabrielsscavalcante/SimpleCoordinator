//
//  MainCoordinator.swift
//  SimpleCoordinator
//
//  Created by Gabriel Cavalcante on 28/01/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        
        let vc = ViewController.instantiate(with: StoryboardID.main)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.coordinator = self
        navigationController.viewControllers = [vc]
    }
    
    func buySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func createAccount() {
        let child = CreateAccountCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func chieldDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
        ) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let buyViewController = fromViewController as? BuyViewController {
            chieldDidFinish(buyViewController.coordinator)
        }
        
        if let createAccountViewController = fromViewController as? CreateAccountViewController {
            chieldDidFinish(createAccountViewController.coordinator)
        }
    }
}
