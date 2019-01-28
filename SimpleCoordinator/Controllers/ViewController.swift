//
//  ViewController.swift
//  SimpleCoordinator
//
//  Created by Gabriel Cavalcante on 28/01/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buyTapped(_ sender: UIButton) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createTapped(_ sender: UIButton) {
        coordinator?.createAccount()
    }
}

