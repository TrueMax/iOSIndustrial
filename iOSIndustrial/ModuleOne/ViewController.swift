//
// ViewController.swift
// iOSIndustrial
// 
// Created by Maxim Abakumov on 2021. 01. 20.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

protocol ViewInput: AnyObject {
    func refreshTable()
}

protocol ViewOutput {
    var buttonTitle: String { get }
    var onSelect: ((String) -> Void)? { get set }
    var tableDataList: [Int] { get }
}

class ViewController: UIViewController {
    
    private var output: ViewOutput
    
    private lazy var oneView = OneView()
    private lazy var tableView = UITableView()
    
    init(output: ViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Первый модуль"
        view.backgroundColor = .cyan
        tapCloseButton()
        configureOneView(title: output.buttonTitle)
    }
    
    func configureOneView(title: String) {
        oneView.buttonTitle = title
        
        view.addSubview(oneView)
        NSLayoutConstraint.activate([
            oneView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            oneView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            oneView.widthAnchor.constraint(equalToConstant: 128),
            oneView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    @objc private func tapCloseButton() {
        output.onSelect?("НАПЕЧАТАТЬ")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // передача данных в ячейку
        output.tableDataList[indexPath.row]
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.onSelect?("")
    }
}

extension ViewController: ViewInput {
    func refreshTable() {
        tableView.reloadData()
    }
}
