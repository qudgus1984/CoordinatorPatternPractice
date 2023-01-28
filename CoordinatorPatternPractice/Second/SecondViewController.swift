//
//  SecondViewController.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/28.
//

import UIKit
import SnapKit

protocol SecondViewControllerDelegate {
    func secondButtonClicked()
}

class SecondViewController: UIViewController {
    
    var mainview = SecondView()
    
    var delegate: SecondViewControllerDelegate?
    
    override func loadView() {
        self.view = mainview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "2->1", style: .plain, target: self, action: #selector(self.secondButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        self.view.backgroundColor = .systemPink
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func secondButtonDidTap() {
        self.delegate?.secondButtonClicked()
    }
    
}
