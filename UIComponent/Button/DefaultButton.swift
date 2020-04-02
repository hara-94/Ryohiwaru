//
//  DefaultButton.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/04/02.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

public class DefaultButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        self.layer.cornerRadius = 18
        self.layer.masksToBounds = true
    }
}
