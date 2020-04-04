//
//  StartPopupView.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/04.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Resource

final class StartPopupView: UIView {

    private let questionLabel: UILabel = .init()
    private let answerTextField: UITextField = .init()
    private let nextButton: UIButton = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    
    private func setLayout() {
        makeEdgeCircle(radius: 15)
        drawBorder(color: Color.Background.buttonStart, width: 2)
        
        addSubview(questionLabel)
        addSubview(answerTextField)
        addSubview(nextButton)
        
        questionLabel.text = "QuestionLabel"
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
        answerTextField.borderStyle = .roundedRect
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            answerTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            answerTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            answerTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        nextButton.makeEdgeCircle(radius: 18)
        nextButton.setTitle("次へ", for: .normal)
        nextButton.setTitleColor(Color.Background.buttonStart, for: .normal)
        nextButton.layer.borderColor = Color.Background.buttonStart.cgColor
        nextButton.layer.borderWidth = 2
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -170),
            nextButton.heightAnchor.constraint(equalToConstant: 36),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: answerTextField.bottomAnchor, constant: 90)
        ])
    }
}
