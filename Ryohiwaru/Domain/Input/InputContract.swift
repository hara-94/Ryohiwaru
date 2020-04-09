//
//  InputContract.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

struct InputDependency: InputBaseDependency {
    typealias View = InputViewController
    typealias Presenter = InputPresenter
    typealias ViewModel = InputViewModel
    typealias PresenterOperation = InputPresenterOperation
}

struct InputViewModel {
    
    let items: [Item]
    
    struct Item {
        let category: String
        let money: Int
        let name: String
    }
}

enum InputPresenterOperation {
    case onTapCell(item: InputViewModel.Item)
    case onTapFloatButton
}
