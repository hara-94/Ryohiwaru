//
//  InputAddCategoryCell.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/17.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Resource

final class InputAddCategoryCell: UICollectionViewCell {
    private let iconView: UIImageView = .init()
    private let titleLabel: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setLayout() {
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.makeEdgeCircle(radius: 8)
        contentView.drawBorder(color: Color.Background.main, width: 2)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 30),
            iconView.heightAnchor.constraint(equalToConstant: 30),
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            iconView.centerXAnchor.constraint(lessThanOrEqualTo: contentView.centerXAnchor),
        ])
        
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    func configure(item: InputAddViewModel.CategoryItem) {
        iconView.image = item.icon
        titleLabel.text = item.title
    }
    
    func selected() {
        iconView.tintColor = Color.Background.buttonStart
        contentView.layer.borderColor = Color.Background.buttonStart.cgColor
    }
    
    func unselected() {
        iconView.tintColor = Color.Selected.unselected
        contentView.layer.borderColor = Color.Background.main.cgColor
    }
}
