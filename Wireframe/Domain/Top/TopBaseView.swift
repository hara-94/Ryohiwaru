//
//  TopBaseView.swift
//  Wireframe
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Base

open class TopBaseView<Dependency: TopBaseDependency>: AppViewController, TopViewContract, ViewModelRepresentable {
    
    public typealias ViewModel = Dependency.ViewModel
    
    public var presenter: TopPresenterInterface!
    public var viewModel: ViewModel?
    
    public func update(viewModel: Dependency.ViewModel?) {
        self.viewModel = viewModel
    }
    
    public static func instantiate(presenter: TopPresenterInterface) -> Self {
        return self.init(presenter: presenter)
    }
    
    public required init(presenter: TopPresenterInterface) {
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
