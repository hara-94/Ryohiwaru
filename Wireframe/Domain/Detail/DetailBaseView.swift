//
//  DetailBaseView.swift
//  Wireframe
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base

open class DetailBaseView<Depedency: DetailBaseDependency>: TabAppViewController, DetailViewContract, ViewModelRepresentable {
    public typealias ViewModel = Depedency.ViewModel
    
    public var presenter: DetailPresenterInterface!
    public var viewModel: ViewModel?
    
    open func update(viewModel: Depedency.ViewModel?) {
        self.viewModel = viewModel
    }
    
    public static func instantiate(presenter: DetailPresenterInterface) -> Self {
        return self.init(presenter: presenter)
    }
    
    public required init(presenter: DetailPresenterInterface) {
        self.presenter = presenter
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public required init() {
        super.init()
    }
    
    public func kick(event: Depedency.PresenterOperation) {
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
