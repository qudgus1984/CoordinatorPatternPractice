//
//  NextViewController.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import UIKit
import SnapKit

protocol LoginViewControllerDelegate {
    func login()
}

class LoginViewController: UIViewController {
    
    var mainview = NextView()

    var delegate: LoginViewControllerDelegate?
    
    override func loadView() {
        self.view = mainview
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(self.loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        self.view.backgroundColor = .systemPink
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func loginButtonDidTap() {
        self.delegate?.login()
    }
}

class NextView: UIView {
    
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
        view.backgroundColor = .systemPink
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
