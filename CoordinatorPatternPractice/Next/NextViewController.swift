//
//  NextViewController.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/26.
//

import UIKit
import SnapKit

protocol NextViewControllerDelegate {
    func back()
}

class NextViewController: UIViewController {
    
    private var mainview = NextView()
    var delegate: NextViewControllerDelegate?
    
    override func loadView() {
        self.view = mainview
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc func backButtonTapped() {
        self.delegate?.back()
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
            make.edges.equalTo(0)
        }
    }
}
