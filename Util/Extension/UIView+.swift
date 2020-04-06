//
//  File.swift
//  Util
//
//  Created by 原暉 on 2020/04/04.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

public extension UIView {
    func makeEdgeCircle(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    func drawBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
