//
//  StartContract.swift
//  Wireframe
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

public protocol StartBaseDependency: AnyDependency where View: StartViewContract {
    associatedtype Presenter: StartPresenterContract
    associatedtype ViewModel
}

public protocol StartViewInterface: AnyViewInterface {
    static func instantiate(presenter: StartPresenterInterface) -> Self
}

public protocol StartViewContract: StartViewInterface {
    var presenter: StartPresenterInterface! { get set }
}

public protocol StartRouterInterface: AnyRouterInterface { }

public protocol StartPresenterInterface: AnyPresenterInterface { }

public protocol StartPresenterContract: StartPresenterInterface {
    associatedtype Dependency: StartBaseDependency
    
    var view: StartViewInterface! { get set }
    var router: StartRouterInterface! { get set }
    init()
}
