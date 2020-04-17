//
//  InputAddContract.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/11.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe

struct InputAddDepedency: InputAddBaseDependency {
    typealias View = InputAddViewController
    typealias Presenter = InputAddPresenter
    typealias ViewModel = InputAddViewModel
    typealias PresenterOperation = InputAddPresenterOperation
}

struct InputAddViewModel {
    let categories: [CategoryItem]
    
    struct CategoryItem {
        let icon: UIImage
        let title: String
        var isSelected: Bool
    }
}

enum InputAddPresenterOperation {
    
}
