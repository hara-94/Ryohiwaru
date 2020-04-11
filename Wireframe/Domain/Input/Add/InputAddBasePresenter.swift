//
//  InputAddBasePresenter.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/10.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class InputAddBasePresenter<Dependency: InputAddBaseDependency>: BasePresenter, InputAddPresenterContract, PresenterEventReactable {
    public weak var view: InputAddViewInterface!
    public var router: InputAddRouterInterface!
    
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
