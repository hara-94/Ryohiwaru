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
    
    open func update(viewModel: Dependency.ViewModel?) {
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
    
    public func kick(event: Dependency.PresenterOperation) {
        if let presenter = presenter as? AnyPresenterEventReactable {
            presenter.on(anyEvent: event)
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.viewDidAppear(animated)
    }
}
