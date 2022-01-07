//
//  MainCoordinator.swift
//  Run
//
//  Created by George Vilnei Arboite Gomes on 28/12/21.
//  Copyright © 2021 George Gomes. All rights reserved.
//

import UIKit
import GGDevelopmentKit

class MainCoordinator: GGCoordinator {
    
    init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let vc = MainViewController()
        show(vc)
    }
}
