//
//  FirstCoordinator.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/28.
//

import UIKit

protocol FirstCoordinatorDelegate {
    func didFirstButtonClicked(_ coordinator: FirstCoordinator)
}

class FirstCoordinator: Coordinator, FirstViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: FirstCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = FirstViewController()
        viewController.delegate = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func firstButtonClicked() {
        self.delegate?.didFirstButtonClicked(self)
    }
}
