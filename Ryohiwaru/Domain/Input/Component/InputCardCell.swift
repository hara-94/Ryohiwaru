//
//  InputCardCell.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Infra

class InputCardCell: UITableViewCell {

    private let backView: UIView = .init()
    private let categoryLabel: UILabel = .init()
    private let moneyLabel: UILabel = .init()
    private let nameLabel: UILabel = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    
    private func setLayout() {
        self.backgroundColor = .clear
        contentView.addSubview(backView)
        contentView.backgroundColor = .clear
        
        backView.addSubview(categoryLabel)
        backView.addSubview(moneyLabel)
        backView.addSubview(nameLabel)
        backView.clipsToBounds = false
        backView.layer.masksToBounds = false
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backView.layer.shadowOpacity = 0.1
        backView.layer.shadowRadius = 10
        backView.backgroundColor = .white
        backView.makeEdgeCircle(radius: 10)
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
        ])
        
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moneyLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            moneyLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: 35),
            nameLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
        ])
    }
    
    func setText(payment: Payment) {
        categoryLabel.text = payment.category
        moneyLabel.text = "\(payment.money)円"
        nameLabel.text = payment.name
    }
}
