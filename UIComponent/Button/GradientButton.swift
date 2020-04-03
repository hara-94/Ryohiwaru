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

    public func setGradient(startColor: UIColor, endColor: UIColor, start: CGPoint, end: CGPoint) {
        (layer as! CAGradientLayer).colors = [
            startColor.cgColor,
            endColor.cgColor
        ]
        (layer as! CAGradientLayer).startPoint = start
        (layer as! CAGradientLayer).endPoint = end
    }
}
