//
//  FirstViewController.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/28.
//

import UIKit
import SnapKit

protocol FirstViewControllerDelegate {
    func firstButtonClicked()
}

class FirstViewController: UIViewController {
    
    var mainview = FirstView()
    
    var delegate: FirstViewControllerDelegate?
    
    override func loadView() {
        self.view = mainview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "1->2", style: .plain, target: self, action: #selector(self.firstButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        self.view.backgroundColor = .systemPink
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func firstButtonDidTap() {
        self.delegate?.firstButtonClicked()
    }
    
}
