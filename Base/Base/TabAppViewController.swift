//
//  TabAppViewController.swift
//  Base
//
//  Created by 原暉 on 2020/04/08.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

open class TabAppViewController: UITabBarController {

    public class func instantiate() -> Self {
        return self.init()
    }
    
    public required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
