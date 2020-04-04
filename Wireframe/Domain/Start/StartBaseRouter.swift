//
//  StartBaseRouter.swift
//  Wireframe
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

open class StartBaseRouter<Dependency: StartBaseDependency> {
    
    public typealias View = Dependency.View
    public typealias Presenter = Dependency.Presenter
    
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

extension StartBaseRouter: StartRouterInterface { }
