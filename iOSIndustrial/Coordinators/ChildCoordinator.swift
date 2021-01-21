//
// ChildCoordinator.swift
// iOSIndustrial
// 
// Created by Maxim Abakumov on 2021. 01. 20.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

class ChildCoordinator: Coordinator {
    var navigation: UINavigationController
    
    var coordinators: [Coordinator] = []
    
    unowned let parentCoordinator: MainCoordinator
    
    init(
        controller: UINavigationController,
        parent: MainCoordinator
    ) {
        self.navigation = controller
        self.parentCoordinator = parent
    }
    
    func start() {
        let nextVM = NextViewModel()
        let nextController = NextController()
        nextController.delegate = nextVM
        navigation.pushViewController(nextController, animated: true)
    }
}

