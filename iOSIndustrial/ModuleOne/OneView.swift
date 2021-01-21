//
// OneView.swift
// iOSIndustrial
// 
// Created by Maxim Abakumov on 2021. 01. 20.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

final class OneView: UIView {
    
    var onButtonTap: (() -> Void)?
    var buttonTitle: String? {
        didSet {
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(.black, for: .normal)
        }
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 128),
            button.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tapButton() {
        
    }
}
