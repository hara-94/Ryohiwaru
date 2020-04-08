//
//  DetailContract.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

public protocol DetailBaseDependency: AnyDependency where View: DetailViewContract {
    associatedtype Presenter: DetailPresenterContract
    associatedtype ViewModel
    associatedtype PresenterOperation
}

public protocol DetailViewInterface: AnyViewInterface {
    static func instantiate(presenter: DetailPresenterInterface) -> Self
}

public protocol DetailViewContract: DetailViewInterface {
    var presenter: DetailPresenterInterface! { get set }
}

public protocol DetailRouterInterface: AnyViewInterface { }

public protocol DetailPresenterInterface: AnyPresenterInterface { }

public protocol DetailPresenterContract: DetailPresenterInterface {
    associatedtype Dependency: DetailBaseDependency
    
    var view: DetailViewInterface! { get set }
    var router: DetailRouterInterface! { get set }
    init()
}
