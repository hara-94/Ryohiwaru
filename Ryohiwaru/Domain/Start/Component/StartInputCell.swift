//
//  StartInputCell.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/05.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Resource
import UIComponent

final class StartInputCell: UITableViewCell {

    private let textField: BorderTextField = .init()
    
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
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        let btmAnchor = textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        btmAnchor.priority = .defaultLow
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            btmAnchor,
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    func showTextField(expanded: Bool) {
        textField.isHidden = expanded ? false : true
    }
}
