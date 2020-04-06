//
//  BorderTextField.swift
//  UIComponent
//
//  Created by 原暉 on 2020/04/06.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Resource

public class BorderTextField: UITextField {
    private let underline: UIView = .init()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.borderStyle = .none
        setUnderline()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.borderStyle = .none
        setUnderline()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setUnderline()
    }
    
    private func setUnderline() {
        addSubview(underline)
        underline.backgroundColor = Color.Selected.unselected
        underline.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underline.widthAnchor.constraint(equalTo: self.widthAnchor),
            underline.heightAnchor.constraint(equalToConstant: 2),
            underline.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            underline.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            underline.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
