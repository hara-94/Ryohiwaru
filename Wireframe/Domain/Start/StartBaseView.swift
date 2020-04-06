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
