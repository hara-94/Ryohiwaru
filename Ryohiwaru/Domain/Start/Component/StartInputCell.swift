//
//  StartInputCell.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/05.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Resource

final class StartInputCell: UITableViewCell {

    private let textField: UITextField = .init()
    private let borderView: UIView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubview(textField)
        contentView.addSubview(borderView)
        
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
        
        borderView.backgroundColor = .black
        borderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -20),
            borderView.heightAnchor.constraint(equalToConstant: 1),
            borderView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            borderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
