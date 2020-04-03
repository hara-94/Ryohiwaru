//
//  UIButton+.swift
//  Util
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

public extension UIButton {
    func makeEdgeCircle(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
