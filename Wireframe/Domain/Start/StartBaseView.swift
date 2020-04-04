//
//  StartBaseView.swift
//  Wireframe
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class StartBaseView<Dependency: StartBaseDependency> :AppViewController, StartViewContract, ViewModelRepresentable {
    
    public typealias ViewModel = Dependency.ViewModel
    
    public var presenter: StartPresenterInterface!
    public var viewModel: ViewModel?
    
    open func update(viewModel: ViewModel?) {
        self.viewModel = viewModel
    }
    
    public static func instantiate(presenter: StartPresenterInterface) -> Self {
        return self.init(presenter: presenter)
    }
    
    public required init(presenter: StartPresenterInterface) {
        self.presenter = presenter
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public required init() {
        super.init()
    }
}
