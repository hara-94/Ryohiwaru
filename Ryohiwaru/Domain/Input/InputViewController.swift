//
//  InputViewController.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource

final class InputViewController: InputBaseView<InputDependency> {
    
    private let tableView: UITableView = .init()
    private let floatButton: InputFloatButton = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = Color.Background.main
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InputCardCell.self, forCellReuseIdentifier: "InputCardCell")
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        setFloatButton()
    }
    
    override func update(viewModel: ViewModel?) {
        super.update(viewModel: viewModel)
    }
}

extension InputViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension InputViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputCardCell", for: indexPath) as! InputCardCell
        return cell
    }
}

private extension InputViewController {
    func setFloatButton() {
        view.addSubview(floatButton)
        floatButton.setTitle("＋", for: .normal)
        floatButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        floatButton.backgroundColor = Color.Background.buttonStart
        floatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            floatButton.widthAnchor.constraint(equalToConstant: 50),
            floatButton.heightAnchor.constraint(equalToConstant: 50),
            floatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            floatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
}
