//
//  CalendarWeekView.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/13.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

final class CalendarWeekView: UIView {
    private let stackView: UIStackView = .init()
    private let week = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setLayout() {
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
        for i in 0...6 {
            let label: UILabel = .init()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 13)
            label.text = week[i]
            stackView.addArrangedSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1 / 7),
                label.topAnchor.constraint(equalTo: stackView.topAnchor),
                label.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            ])
            if i % 2 == 0 {
                label.backgroundColor = .yellow
            } else {
                label.backgroundColor = .blue
            }
        }
    }
}
