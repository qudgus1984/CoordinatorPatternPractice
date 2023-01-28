//
//  SecondCoordinator.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/28.
//

import UIKit

protocol SecondCoordinatorDelegate {
    func didSecondButtonClicked(_ coordinator: SecondCoordinator)
}

class SecondCoordinator: Coordinator, SecondViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: SecondCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SecondViewController()
        viewController.delegate = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func secondButtonClicked() {
        self.delegate?.didSecondButtonClicked(self)
    }
}
