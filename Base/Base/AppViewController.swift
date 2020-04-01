//
//  AppViewController.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

open class AppViewController: UIViewController {

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
