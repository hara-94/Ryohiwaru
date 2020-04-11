//
//  InputAddBaseRouter.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/10.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

open class InputAddBaseRouter<Dependency: InputAddBaseDependency> {
    public typealias View = Dependency.View
    public typealias Presenter = Dependency.Presenter
    
    unowned let view: View
    
    public required init(view: View) {
        self.view = view
    }
    
    public class func assemble() -> View {
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

extension InputAddBaseRouter: InputAddRouterInterface { }
