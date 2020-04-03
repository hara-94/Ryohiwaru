//
//  TopViewController.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource
import UIComponent
import Util

final class TopViewController: TopBaseView<TopDependency> {
    
    let manageButton: UIButton = .init()
    let joinButton: UIButton = .init()
    let startButton: GradientButton = .init()
    let stackView: UIStackView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Color.Background.main
        
        self.view.addSubview(stackView)
        self.view.addSubview(startButton)
        
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(manageButton)
        stackView.addArrangedSubview(joinButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -150),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50)
        ])
        manageButton.setTitle("manage", for: .normal)
        manageButton.makeEdgeCircle(radius: 18)
        manageButton.backgroundColor = Color.Background.button
        manageButton.translatesAutoresizingMaskIntoConstraints = false
        manageButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        joinButton.setTitle("join", for: .normal)
        joinButton.setTitleColor(Color.Background.button, for: .normal)
        joinButton.makeEdgeCircle(radius: 18)
        joinButton.backgroundColor = Color.Background.main
        joinButton.layer.borderWidth = 2
        joinButton.layer.borderColor = Color.Background.button.cgColor
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        startButton.setTitle("start", for: .normal)
        startButton.backgroundColor = .clear
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setGradient(top: Color.Background.button, bottom: Color.Background.main)
        startButton.makeEdgeCircle(radius: 18)
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -150),
            startButton.heightAnchor.constraint(equalToConstant: 36),
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    override func update(viewModel: TopViewModel?) {
        super.update(viewModel: viewModel)
    }
}
