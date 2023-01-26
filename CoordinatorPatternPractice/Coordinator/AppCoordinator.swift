//
//  AppCoordinator.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import UIKit

class AppCoordinator: Coordinator, MainCoordinatorDelegate, NextCoordinatorDelegate {
    
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var isNext: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        if self.isNext {
            self.showNextViewController()
        } else {
            self.showMainViewController()
        }
    }
    
    private func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    private func showNextViewController() {
        let coordinator = NextCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
        
    }
    
    func didNext(_ coordinator: MainCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showMainViewController()
    }
    
    func didBack(_ coordinator: NextCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showNextViewController()
    }
}
