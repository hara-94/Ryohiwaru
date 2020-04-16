//
//  CalendarContract.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/12.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

public protocol CalendarBaseDependency: AnyDependency where View: CalendarViewContract {
    associatedtype Presenter: CalendarPresenterContract
    associatedtype ViewModel
    associatedtype PresenterOperation
}

public protocol CalendarViewInterface: AnyViewInterface {
    static func instantiate(presenter: CalendarPresenterInterface) -> Self
}

public protocol CalendarViewContract: CalendarViewInterface {
    var presenter: CalendarPresenterInterface! { get set }
}

public protocol CalendarRouterInterface: AnyRouterInterface { }

public protocol CalendarPresenterInterface: AnyPresenterInterface { }

public protocol CalendarPresenterContract: CalendarPresenterInterface {
    associatedtype Dependency: CalendarBaseDependency
    
    var view: CalendarViewInterface! { get set }
    var router: CalendarRouterInterface! { get set }
    init()
}

