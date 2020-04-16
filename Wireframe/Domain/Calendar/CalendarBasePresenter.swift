//
//  CalendarBasePresenter.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/12.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class CalendarBasePresenter<Dependency: CalendarBaseDependency>: BasePresenter, CalendarPresenterContract, PresenterEventReactable {
    public weak var view: CalendarViewInterface!
    public var router: CalendarRouterInterface!
    
    public required override init() {
        super.init()
    }
    
    public func update(viewModel: Dependency.ViewModel) {
        if let view = view as? AnyViewRepresentable {
            view.update(anyViewModel: viewModel)
        }
    }
    
    open func on(event: Dependency.PresenterOperation) { }
}
