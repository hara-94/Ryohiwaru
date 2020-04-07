//
//  ManageContract.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

public protocol ManageBaseDependency: AnyDependency where View: ManageViewContract {
    associatedtype Presenter: ManagePresenterContract
    associatedtype ViewModel
    associatedtype PresenterOperation
}

public protocol ManageViewInterface: AnyViewInterface {
    static func instantiate(presenter: ManagePresenterInterface) -> Self
}

public protocol ManageViewContract: ManageViewInterface {
    var presenter: ManagePresenterInterface! { get set }
}

public protocol ManageRouterInterface: AnyRouterInterface { }

public protocol ManagePresenterInterface: AnyPresenterInterface { }

public protocol ManagePresenterContract: ManagePresenterInterface {
    associatedtype Dependency: ManageBaseDependency
    
    var view: ManageViewInterface! { get set }
    var router: ManageRouterInterface! { get set }
    init()
}
