//
//  InputAddContract.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/10.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

public protocol InputAddBaseDependency: AnyDependency where View: InputAddViewContract {
    associatedtype Presenter: InputAddPresenterContract
    associatedtype ViewModel
    associatedtype PresenterOperation
}

public protocol InputAddViewInterface: AnyViewInterface {
    static func instantiate(presenter: InputAddPresenterInterface) -> Self
}

public protocol InputAddViewContract: InputAddViewInterface {
    var presenter: InputAddPresenterInterface! { get set }
}

public protocol InputAddRouterInterface: AnyRouterInterface { }

public protocol InputAddPresenterInterface: AnyPresenterInterface { }

public protocol InputAddPresenterContract: InputAddPresenterInterface {
    associatedtype Dependency: InputAddBaseDependency
    
    var view: InputAddViewInterface! { get set }
    var router: InputAddRouterInterface! { get set }
    init()
}
