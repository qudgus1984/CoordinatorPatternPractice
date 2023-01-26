//
//  MainCoordinator.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import UIKit

protocol MainCoordinatorDelegate {
    func didNext(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator, MainViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func next() {
        self.delegate?.didNext(self)
    }
}
