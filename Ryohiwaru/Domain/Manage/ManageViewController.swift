//
//  ManageViewController.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource

final class ManageViewController: ManageBaseView<ManageDepedency> {
    
    private let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.Background.main
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ManageTravelItemCell.self, forCellReuseIdentifier: "ManageTravelItemCell")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    override func update(viewModel: ManageViewModel?) {
        super.update(viewModel: viewModel)
    }
}

extension ManageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ManageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageTravelItemCell", for: indexPath) as! ManageTravelItemCell
        return cell
    }
}
