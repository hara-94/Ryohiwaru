//
//  InputContract.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe
import Infra

struct InputInteractorDependency: InputBaseInteractorDependency {
    typealias Input = InputDemoInteractor
}

struct InputDependency: InputBaseDependency {
    typealias View = InputViewController
    typealias Presenter = InputPresenter
    typealias IntereactorDependency = InputInteractorDependency
    typealias ViewModel = InputViewModel
    typealias PresenterOperation = InputPresenterOperation
}

struct InputViewModel {
    let payments: [Payment]
}

enum InputPresenterOperation {
    case onTapCell(payment: Payment)
    case onTapFloatButton
}
