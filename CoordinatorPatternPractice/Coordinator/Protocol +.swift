//
//  Protocol +.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import UIKit

protocol Coordinator : class {
    
    var childCoordinators : [Coordinator] { get set }
    func start()
}



