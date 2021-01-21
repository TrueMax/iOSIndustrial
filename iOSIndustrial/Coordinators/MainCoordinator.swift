//
// MainCoordinator.swift
// iOSIndustrial
// 
// Created by Maxim Abakumov on 2021. 01. 20.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigation: UINavigationController
    var coordinators: [Coordinator] = []
    lazy var model: DataModel = DataModel()
    
    init() {
        navigation = UINavigationController()
    }
    
    func start() {
        let controller = configureModuleOne()
        navigation.pushViewController(controller, animated: true)
    }
    
    private func configureModuleOne() -> UIViewController {
        let viewModel = ViewModel()
        
        // ModuleOne input
        viewModel.buttonTitle = self.model.buttonTitle
        viewModel.infoList = self.model.dataList
        
        // ModuleOne output
        viewModel.onSelectParameter = { string in
            self.startChildCoordinator(data: string)
        }
        let controller = ViewController(output: viewModel)
        viewModel.viewInput = controller
        return controller
    }
    
    private func startChildCoordinator(data: String) {
        let coordinator = ChildCoordinator(
            controller: navigation,
            parent: self
        )
        
        // выполнение в главном потоке с задержкой, неблокирующий вызов
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            coordinator.start()
        }
    }
}
