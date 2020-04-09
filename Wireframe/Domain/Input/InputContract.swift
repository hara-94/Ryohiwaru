//
//  InputContract.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/08.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base
import Infra


public protocol InputBaseInteractorDependency {
    associatedtype Input: InputUseCase
}

public protocol InputBaseDependency: AnyDependency where View: InputViewContract {
    associatedtype Presenter: inputPresenterContract
    associatedtype IntereactorDependency: InputBaseInteractorDependency
    associatedtype ViewModel
    associatedtype PresenterOperation
}

public protocol InputViewInterface: AnyViewInterface {
    static func instantiate(presenter: InputPresenterInterface) -> Self
}

public protocol InputViewContract: InputViewInterface {
    var presenter: InputPresenterInterface! { get set }
}

public protocol InputRouterInterface: AnyRouterInterface { }

public protocol InputPresenterInterface: AnyPresenterInterface { }

public protocol inputPresenterContract: InputPresenterInterface {
    associatedtype Dependency: InputBaseDependency
    
    var view: InputViewInterface! { get set }
    var router: InputRouterInterface! { get set }
    init()
}
