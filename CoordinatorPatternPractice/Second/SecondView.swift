//
//  SecondView.swift
//  CoordinatorPatternPractice
//
//  Created by 이병현 on 2023/01/28.
//

import UIKit
import SnapKit

class SecondView: UIView {
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
        view.backgroundColor = .systemYellow
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
