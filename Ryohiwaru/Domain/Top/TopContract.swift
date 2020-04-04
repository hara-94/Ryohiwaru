//
//  TopContract.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base
import Wireframe

struct TopDependency: TopBaseDependency {

    typealias View = TopViewController
    typealias Presenter = TopPresenter
    typealias ViewModel = TopViewModel
    typealias PresenterOperation = TopPresenterOperation
}

struct TopViewModel { }

enum TopPresenterOperation {
    case onTapManageButton
    case onTapJoinButton
    case onTapStartButton
}
