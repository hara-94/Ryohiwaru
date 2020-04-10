//
//  InputBasePresenter.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/08.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class InputBasePresenter<Dependency: InputBaseDependency>: BasePresenter, InputPresenterContract, PresenterEventReactable {
    public weak var view: InputViewInterface!
    public var router: InputRouterInterface!
    
    public private(set) lazy var inputInteractor: Dependency.IntereactorDependency.Input = {
        return resolveInputInteractor()
    }()
    
    public required override init() {
        super.init()
    }
    
    public func update(viewModel: Dependency.ViewModel) {
        if let view = view as? AnyViewRepresentable {
            view.update(anyViewModel: viewModel)
        }
    }
    
    open func resolveInputInteractor() -> Dependency.IntereactorDependency.Input {
        fatalError("Must override resolveInputInteractor")
    }
    
    open func on(event: Dependency.PresenterOperation) { }
}
