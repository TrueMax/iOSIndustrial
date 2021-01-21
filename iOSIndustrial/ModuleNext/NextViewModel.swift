//
// NextViewModel.swift
// iOSIndustrial
// 
// Created by Maxim Abakumov on 2021. 01. 20.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

class NextViewModel {
    
}

extension NextViewModel: NextControllerDelegate {
    func didPassData(nextController: NextController, data: String) {
        print(data)
    }
}
