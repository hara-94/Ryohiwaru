//
//  InputAddColumnView.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/16.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

final class InputAddColumnView: UIView {
    private let titleLabel: UILabel = .init()
    private let textField: UITextField = .init()
    private let yenLabel: UILabel = .init()
    private let dateLabel: UILabel = .init()
    private let nextButton: UIButton = .init()
    private let prevButton: UIButton = .init()
    private let stackView: UIStackView = .init()
    var type: InputType = .date
    
    enum InputType {
        case date
        case memo
        case input
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(type: InputType) {
        super.init(frame: .zero)
        self.type = type
        setLayout()
    }
    
    private func setLayout() {
        self.addSubview(titleLabel)
        
        titleLabel.text = "Title"
        titleLabel.backgroundColor = .yellow
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 40),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ])
        
        switch self.type {
        case .date:
            setDate()
        case .memo:
            setMemo()
        case .input:
            setInput()
        }
    }
    
    private func setDate() {
        self.addSubview(dateLabel)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(prevButton)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(nextButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
        
        prevButton.setTitle("<", for: .normal)
        prevButton.backgroundColor = .red
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prevButton.widthAnchor.constraint(equalToConstant: 40),
            prevButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            prevButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
        
        nextButton.setTitle(">", for: .normal)
        nextButton.backgroundColor = .blue
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 40),
            nextButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            nextButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
        
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: stackView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
    }
    
    private func setMemo() {
        self.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    private func setInput() {
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(yenLabel)
        stackView.spacing = 10
        stackView.alignment = .bottom
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
        
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: stackView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
        
        yenLabel.text = "円"
        
        yenLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yenLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
    }
}
