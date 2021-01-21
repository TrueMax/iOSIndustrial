//
// NextController.swift
// iOSIndustrial
// 
// Created by Maxim Abakumov on 2021. 01. 20.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

protocol NextControllerDelegate: AnyObject {
    func didPassData(nextController: NextController, data: String)
}


class NextController: UIViewController {
    
    weak var delegate: NextControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Второй модуль"
        view.backgroundColor = .red
    }
    
    private func passData(data: String) {
        delegate?.didPassData(nextController: self, data: data)
    }
}
