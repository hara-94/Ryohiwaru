//
//  TopContract.swift
//  Wireframe
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

public protocol TopBaseDependency: AnyDependency where View: TopViewContract {
    associatedtype Presenter: TopPresenterContract
    associatedtype ViewModel
}

public protocol TopViewInterface: AnyViewInterface { }

public protocol TopViewContract: TopViewInterface { }

public protocol TopRouterInterface: AnyRouterInterface { }

public protocol TopPresenterInterface: AnyPresenterInterface { }

public protocol TopPresenterContract: TopPresenterInterface {
    associatedtype Dependency: TopBaseDependency
    
    var view: TopViewInterface! { get set }
    var router: TopRouterInterface! { get set }
}
