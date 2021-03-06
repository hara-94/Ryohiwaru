//
//  ManageContract.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base
import Wireframe
import Infra

struct ManageDepedency: ManageBaseDependency {
    
    typealias View = ManageViewController
    typealias Presenter = ManagePresenter
    typealias ViewModel = ManageViewModel
    typealias PresenterOperation = ManagePresenterOperation
}

struct ManageViewModel {
    public let travels: [Travel]
}

enum ManagePresenterOperation {
    case onTapCell(index: Int)
}
