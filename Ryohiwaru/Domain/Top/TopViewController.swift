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
        
        setStackView()
        setManageButton()
        setJoinButton()
        setStartButton()
    }
    
    override func update(viewModel: TopViewModel?) {
        super.update(viewModel: viewModel)
    }
}

private extension TopViewController {
    func setStackView() {
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
    }
    
    func setManageButton() {
        manageButton.setTitle("Manage", for: .normal)
        manageButton.makeEdgeCircle(radius: 18)
        manageButton.backgroundColor = Color.Background.buttonStart
        manageButton.addTarget(self, action: #selector(manageButtonOnPressed(_:)), for: .touchUpInside)
        manageButton.translatesAutoresizingMaskIntoConstraints = false
        manageButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setJoinButton() {
        joinButton.setTitle("Join", for: .normal)
        joinButton.setTitleColor(Color.Background.buttonStart, for: .normal)
        joinButton.makeEdgeCircle(radius: 18)
        joinButton.backgroundColor = Color.Background.main
        joinButton.layer.borderWidth = 2
        joinButton.layer.borderColor = Color.Background.buttonStart.cgColor
        joinButton.addTarget(self, action: #selector(joinButtonOnPressed(_:)), for: .touchUpInside)
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setStartButton() {
        startButton.setTitle("Start Travel", for: .normal)
        startButton.backgroundColor = .clear
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setGradient(
            startColor: Color.Background.buttonStart, endColor: Color.Background.buttonEnd, start: CGPoint(x: 0, y: 0.5), end: CGPoint(x: 1, y: 0.5))
        startButton.makeEdgeCircle(radius: 18)
        startButton.addTarget(self, action: #selector(startButtonOnPressed(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -150),
            startButton.heightAnchor.constraint(equalToConstant: 36),
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func manageButtonOnPressed(_ sender: Any?) {
        print("manageButtonOnPressed")
    }
    
    @objc func joinButtonOnPressed(_ sender: Any?) {
        print("joinButtonOnPressed")
    }
    
    @objc func startButtonOnPressed(_ sender: Any?) {
        print("startButtonOnPressed")
    }
}
