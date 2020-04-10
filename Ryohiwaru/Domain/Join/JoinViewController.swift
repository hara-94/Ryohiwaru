//
//  JoinViewController.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource
import UIComponent

final class JoinViewController: JoinBaseView<JoinDependency> {
    
    private let titleLabel: UILabel = .init()
    private let explainLabel: UILabel = .init()
    private let textField: BorderTextField = .init()
    private let joinButton: UIButton = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.Background.main
        
        setTitleLabel()
        setExplainLabel()
        setTextField()
        setButton()
    }
    
    override func update(viewModel: JoinViewModel?) {
        super.update(viewModel: viewModel)
    }
}

private extension JoinViewController {
    func setTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "旅行に参加する"
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setExplainLabel() {
        view.addSubview(explainLabel)
        explainLabel.text = "参加する旅行のIDを入力してください"
        explainLabel.font = UIFont.systemFont(ofSize: 15)
        explainLabel.textColor = Color.Text.explain
        explainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            explainLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            explainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setTextField() {
        view.addSubview(textField)
        textField.placeholder = "旅行ID"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: explainLabel.bottomAnchor, constant: 30),
        ])
    }
    
    func setButton() {
        view.addSubview(joinButton)
        joinButton.setTitle("Join", for: .normal)
        joinButton.makeEdgeCircle(radius: 18)
        joinButton.backgroundColor = Color.Background.buttonStart
        joinButton.addTarget(self, action: #selector(onTapSubmit), for: .touchUpInside)
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            joinButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            joinButton.heightAnchor.constraint(equalToConstant: 36),
            joinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            joinButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40),
        ])
    }
    
    @objc func onTapSubmit() {
        guard let id = textField.text else {
            return
        }
        if id != "" {
            textField.text = ""
            kick(event: .onTapSubmit(id: id))
        }
    }
}
