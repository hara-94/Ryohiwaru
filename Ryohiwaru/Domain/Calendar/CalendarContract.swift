//
//  CalendarContract.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/12.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

struct CalendarDependency: CalendarBaseDependency {
    typealias View = CalendarViewController
    typealias Presenter = CalendarPresenter
    typealias ViewModel = CalendarViewModel
    typealias PresenterOperation = CalendarPresenterOperation
}

struct CalendarViewModel { }

enum CalendarPresenterOperation { }
