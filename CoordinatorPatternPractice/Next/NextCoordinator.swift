//
//  NextCoordinator.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import UIKit

protocol NextCoordinatorDelegate {
    func didBack(_ coordinator: NextCoordinator)
}

class NextCoordinator: Coordinator, NextViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var delegate: NextCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = NextViewController()
        viewController.view.backgroundColor = .cyan
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func back() {
        self.delegate?.didBack(self)
    }
}
