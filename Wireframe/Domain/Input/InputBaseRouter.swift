//
//  InputBaseRouter.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/08.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

open class InputBaseRouter<Depedency: InputBaseDependency> {
    public typealias View = Depedency.View
    public typealias Presenter = Depedency.Presenter
    
    unowned let view: View
    
    public required init(view: View) {
        self.view = view
    }
    
    open class func assemble() -> View {
        let presenter = resolvePresenter()
        let view = View.instantiate(presenter: presenter)
        let router = self.init(view: view)
        
        presenter.view = view
        presenter.router = router
        return view
    }
    
    open class func resolvePresenter() -> Presenter {
        fatalError("Must override resolvePresenter")
    }
}

extension InputBaseRouter: InputRouterInterface { }
