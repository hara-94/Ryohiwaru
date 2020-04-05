//
//  StartViewController.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource

final class StartViewController: StartBaseView<StartDepedency> {
    
    private let tableView: UITableView = .init()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StartInputCell.self, forCellReuseIdentifier: "StartInputCell")
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
    override func update(viewModel: StartViewModel?) {
        super.update(viewModel: viewModel)
        
    }
}

extension StartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let viewModel = self.viewModel else {
            fatalError("viewModel is not defined successfully")
        }
        if viewModel.sections[indexPath.section].expanded {
            return 60
        } else {
            return 8
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StartViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = self.viewModel else {
            fatalError("viewModel is not defined successfully")
        }
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let _ = self.viewModel else {
            fatalError("viewModel is not defined successfully")
        }
        let headerView = StartHeaderView()
        headerView.config(title: self.viewModel!.sections[section].title, section: section) { [unowned self] section in
            self.viewModel!.sections[section].expanded = !self.viewModel!.sections[section].expanded
            self.tableView.beginUpdates()
            for i in 0..<self.viewModel!.sections[section].values.count {
                self.tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
            }
            self.tableView.endUpdates()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel else {
            fatalError("viewModel is not defined successfully")
        }
        return viewModel.sections[section].values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StartInputCell", for: indexPath) as! StartInputCell
        return cell
    }
}
