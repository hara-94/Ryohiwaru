//
//  CalendarCell.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/12.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

final class CalendarCell: UICollectionViewCell {
    private let label: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        contentView.addSubview(label)
        label.text = "Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
