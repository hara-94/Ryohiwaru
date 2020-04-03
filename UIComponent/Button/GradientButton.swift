//
//  GradientButton.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

public class GradientButton: UIButton {
    
    public override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }

    public func setGradient(top: UIColor, bottom: UIColor) {
        (layer as! CAGradientLayer).colors = [
            top.cgColor,
            bottom.cgColor
        ]
        (layer as! CAGradientLayer).startPoint = CGPoint(x: 0, y: 0.5)
        (layer as! CAGradientLayer).endPoint = CGPoint(x: 1, y: 1)
    }
}
