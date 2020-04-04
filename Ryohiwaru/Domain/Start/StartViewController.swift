//
//  StartViewController.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe
import Resource

final class StartViewController: StartBaseView<StartDepedency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Color.Background.main
    }
}
