//
//  StartContract.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base
import Wireframe

struct StartDepedency: StartBaseDependency {
  
    typealias View = StartViewController
    typealias Presenter = StartPresenter
    typealias ViewModel = StartViewModel
    typealias PresenterOperation = StartPresenterOperation
}

struct StartViewModel {
    
    var sections: [Section]
    
    struct Section {
        var title: String
        var values: [String]
        var expanded: Bool
        var cellType: CellType
        
        enum CellType {
            case defaultCell
            case date
        }
    }
}

enum StartPresenterOperation {
    case onTapHeader
    case onTapRegisterButton
}
