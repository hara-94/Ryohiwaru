//
//  InputAddBaseView.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/10.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base
import Resource

open class InputAddBaseView<Dependency: InputAddBaseDependency>: AppViewController, InputAddViewContract, ViewModelRepresentable {
    public typealias ViewModel = Dependency.ViewModel
    
    public var presenter: InputAddPresenterInterface!
    public var viewModel: ViewModel?
    
    open func update(viewModel: ViewModel?) {
        self.viewModel = viewModel
    }
    
    public static func instantiate(presenter: InputAddPresenterInterface) -> Self {
        return self.init(presenter: presenter)
    }
    
    public required init(presenter: InputAddPresenterInterface) {
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
        
        view.backgroundColor = Color.Background.main
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
