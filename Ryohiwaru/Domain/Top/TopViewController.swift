//
//  TopViewController.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource
import UIComponent

final class TopViewController: TopBaseView<TopDependency> {
    
    let button: DefaultButton = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Color.Background.main
    }
    
    override func update(viewModel: TopViewModel?) {
        super.update(viewModel: viewModel)
    }
}
