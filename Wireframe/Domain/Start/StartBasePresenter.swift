//
//  StartBasePresenter.swift
//  Wireframe
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class StartBasePresenter<Dependency: StartBaseDependency>: BasePresenter, StartPresenterContract {
    
    public weak var view: StartViewInterface!
    public var router: StartRouterInterface!
    
    public required override init() {
        super.init()
    }
    
    public func update(viewModel: Dependency.ViewModel) {
        if let view = view as? AnyViewRepresentable {
            view.update(anyViewModel: viewModel)
        }
    }
}
