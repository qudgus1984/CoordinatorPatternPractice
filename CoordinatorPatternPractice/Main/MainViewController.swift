//
//  ViewController.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import UIKit
import SnapKit

protocol MainViewControllerDelegate {
    func next()
}

class MainViewController: UIViewController {
    
    private var mainview = MainView()
    
    var delegate: MainViewControllerDelegate?
    
    override func loadView() {
        self.view = mainview
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextButtonTapped))
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc func nextButtonTapped() {
        self.delegate?.next()
    }
}

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
        setConstants()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    func configure() {
        self.addSubview(bgView)
    }
    
    func setConstants() {
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
}
