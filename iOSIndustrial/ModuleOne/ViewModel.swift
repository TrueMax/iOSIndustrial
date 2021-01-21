//
// ViewModel.swift
// iOSIndustrial
// 
// Created by Maxim Abakumov on 2021. 01. 20.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

protocol ModuleOneOutput {
    var onSelectParameter: ((String) -> Void)? { get set }
}

protocol ModuleOneInput {
    var buttonModuleTitle: String? { get set }
    var infoList: [Int] { get set }
}

class ViewModel: ViewOutput, ModuleOneOutput, ModuleOneInput {
    
    var infoList: [Int] = []
    var tableDataList: [Int] {
        return infoList
    }
    
    var buttonModuleTitle: String?
    
    var onSelectParameter: ((String) -> Void)?
    
    lazy var buttonTitle: String = {
        return buttonModuleTitle!
    }()
    
    weak var viewInput: ViewInput?
    
    lazy var onSelect: ((String) -> Void)? = { string in
        self.onSelectParameter?(string)
    }
}
