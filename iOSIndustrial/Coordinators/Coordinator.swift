//
// Coordinator.swift
// iOSIndustrial
// 
// Created by Maxim Abakumov on 2021. 01. 20.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    var coordinators: [Coordinator] { get set }
    func start() 
}
