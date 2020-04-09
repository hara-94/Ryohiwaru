//
//  InputFloatButton.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

final class InputFloatButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeEdgeCircle(radius: 25)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeEdgeCircle(radius: 25)
    }
}
