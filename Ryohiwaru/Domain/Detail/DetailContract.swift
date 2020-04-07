//
//  DetailContract.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

struct DetailDepedency: DetailBaseDependency {
    typealias View = DetailViewController
    typealias Presenter = DetailPresenter
    typealias ViewModel = DetailViewModel
    typealias PresenterOperation = DetailPresenterOperation
}

struct DetailViewModel { }

enum DetailPresenterOperation { }
