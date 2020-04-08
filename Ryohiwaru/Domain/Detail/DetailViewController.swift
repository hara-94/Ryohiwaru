//
//  DetailViewController.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe
import Resource

final class DetailViewController: DetailBaseView<DetailDepedency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.Background.main
    }
    
    override func update(viewModel: DetailViewModel?) {
        super.update(viewModel: viewModel)
    }
}
