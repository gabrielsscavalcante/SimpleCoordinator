//
//  MainTabBarViewController.swift
//  SimpleCoordinator
//
//  Created by Gabriel Cavalcante on 26/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    let main = MainCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.start()
        viewControllers = [main.navigationController]
    }
}
