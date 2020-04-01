//
//  AnyContract.swift
//  Base
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public protocol AnyPresenterInterface: BasePresenter {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

public protocol AnyRouterInterface: AnyObject { }

public protocol AnyViewInterface: AnyObject { }

public protocol AnyDependency {
    associatedtype View
    associatedtype ViewModel
}
