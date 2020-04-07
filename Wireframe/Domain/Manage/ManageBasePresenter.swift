//
//  ManageBasePresenter.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class ManageBasePresenter<Dependency: ManageBaseDependency>: BasePresenter, ManagePresenterContract, PresenterEventReactable {
    
    public weak var view: ManageViewInterface!
    public var router: ManageRouterInterface!
    
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
