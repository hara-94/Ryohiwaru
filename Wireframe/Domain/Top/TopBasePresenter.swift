//
//  TopBasePresenter.swift
//  Wireframe
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class TopBasePresenter<Dependency: TopBaseDependency>: BasePresenter, TopPresenterContract {
    
    public var view: TopViewInterface!
    public var router: TopRouterInterface!
 
    public func update(viewModel: Dependency.ViewModel) {
        if let view = view as? AnyViewRepresentable {
            view.update(anyViewModel: viewModel)
        }
    }
}
