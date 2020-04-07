//
//  JoinContract.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

public protocol JoinBaseDependency: AnyDependency where View: JoinViewContract {
    associatedtype Presenter: JoinPresenterContract
    associatedtype ViewModel
    associatedtype PresenterOperation
}

public protocol JoinViewInterface: AnyViewInterface {
    static func instantiate(presenter: JoinPresenterInterface) -> Self
}

public protocol JoinViewContract: JoinViewInterface {
    var presenter: JoinPresenterInterface! { get set }
}

public protocol JoinRouterInterface: AnyRouterInterface { }

public protocol JoinPresenterInterface: AnyPresenterInterface { }

public protocol JoinPresenterContract: JoinPresenterInterface {
    associatedtype Dependency: JoinBaseDependency
    
    var view: JoinViewInterface! { get set }
    var router: JoinRouterInterface! { get set }
    init()
}
