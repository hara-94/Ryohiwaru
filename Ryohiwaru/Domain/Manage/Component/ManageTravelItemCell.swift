//
//  ManageTravelItemCell.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

final class ManageTravelItemCell: UITableViewCell {
    
    private let stackView: UIStackView = .init()
    private let titleLabel: UILabel = .init()
    private let dateLabel: UILabel = .init()
    private let paymentLabel: UILabel = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubview(stackView)
        contentView.addSubview(paymentLabel)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
        titleLabel.text = "Title"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        ])
        
        dateLabel.text = "Date"
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        paymentLabel.text = "000円"
        paymentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paymentLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            paymentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            paymentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}
