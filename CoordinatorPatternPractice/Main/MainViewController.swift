//
//  ViewController.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import UIKit
import SnapKit

protocol MainViewControllerDelegate {
    func logout()
}

class MainViewController: UIViewController {
    
    var mainview = MainView()
    
//    override func loadView() {
////        self.view = mainview
//    }

    var delegate: MainViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemRed
        
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func logoutButtonDidTap() {
        self.delegate?.logout()
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
        view.backgroundColor = .yellow
        return view
    }()
    
    func configure() {
        self.addSubview(bgView)
    }
    
    func setConstants() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
