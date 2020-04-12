//
//  InputMoneyView.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/11.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Resource

final class InputMoneyView: UIView {

    private let dateLabel: UILabel = .init()
    private let titleLabel: UILabel = .init()
    private let moneyStackView: UIStackView = .init()
    private let moneyLabel: UILabel = .init()
    private let yenLabel: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    
    private func setLayout() {
        self.addSubview(dateLabel)
        self.addSubview(titleLabel)
        self.addSubview(moneyStackView)
        
        dateLabel.text = "2020/xx/xx ~ 20202/xx/xx"
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ])
        
        titleLabel.text = "Total"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ])
        
        moneyStackView.addArrangedSubview(moneyLabel)
        moneyStackView.addArrangedSubview(yenLabel)
        moneyStackView.spacing = 3
        moneyStackView.alignment = .bottom
        moneyStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moneyStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            moneyStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ])
        
        moneyLabel.font = UIFont.systemFont(ofSize: 20)
        moneyLabel.text = "10,000"
        
        yenLabel.font = UIFont.systemFont(ofSize: 13)
        yenLabel.text = "円"
    }
}
