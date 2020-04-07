//
//  JoinContract.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

struct JoinDependency: JoinBaseDependency {
    
    typealias View = JoinViewController
    typealias Presenter = JoinPresenter
    typealias ViewModel = JoinViewModel
    typealias PresenterOperation = JoinPresenterOperation
}

struct JoinViewModel {
    
}

enum JoinPresenterOperation {
    case onTapSubmit
}
