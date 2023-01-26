//
//  Protocol +.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import Foundation

protocol Coordinator : class {
    
    var childCoordinators : [Coordinator] { get set }
    func start()
}


