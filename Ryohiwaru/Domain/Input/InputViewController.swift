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
    
    private let moneyView: InputMoneyView = .init()
    private let tableView: UITableView = .init(frame: .zero, style: .grouped)
    private let floatButton: InputFloatButton = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Color.Background.buttonEnd
        
        setMoneyView()
        setTableView()
        setFloatButton()
    }
    
    override func update(viewModel: ViewModel?) {
        super.update(viewModel: viewModel)
    }
}

extension InputViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension InputViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel else {
            fatalError("viewModel is not defined successfully")
        }
        return viewModel.payments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = self.viewModel else {
            fatalError("viewModel is not defined successfully")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputCardCell", for: indexPath) as! InputCardCell
        cell.setText(payment: viewModel.payments[indexPath.row])
        return cell
    }
}

private extension InputViewController {
    func setTableView() {
        tableView.backgroundColor = Color.Background.main
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InputCardCell.self, forCellReuseIdentifier: "InputCardCell")
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 15
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: moneyView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setMoneyView() {
        view.addSubview(moneyView)
        moneyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moneyView.heightAnchor.constraint(equalToConstant: 230),
            moneyView.topAnchor.constraint(equalTo: view.topAnchor),
            moneyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moneyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setFloatButton() {
        view.addSubview(floatButton)
        floatButton.setTitle("＋", for: .normal)
        floatButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        floatButton.backgroundColor = Color.Background.buttonStart
        floatButton.addTarget(self, action: #selector(floatButtonOnPressed(_:)), for: .touchUpInside)
        floatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            floatButton.widthAnchor.constraint(equalToConstant: 50),
            floatButton.heightAnchor.constraint(equalToConstant: 50),
            floatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            floatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    @objc func floatButtonOnPressed(_ sender: Any?) {
        kick(event: .onTapFloatButton)
    }
}
