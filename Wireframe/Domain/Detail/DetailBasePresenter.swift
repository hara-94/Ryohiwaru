//
//  DetailBasePresenter.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class DetailBasePresenter<Dependency: DetailBaseDependency>: BasePresenter, DetailPresenterContract, PresenterEventReactable {
    
    public weak var view: DetailViewInterface!
    public var router: DetailRouterInterface!
    
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
