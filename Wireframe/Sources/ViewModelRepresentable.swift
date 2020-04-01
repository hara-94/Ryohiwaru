//
//  ViewModelRepresentable.swift
//  Base
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public protocol AnyViewRepresentable {
    func update(anyViewModel: Any?)
}

public protocol ViewModelRepresentable: AnyViewRepresentable {
    associatedtype ViewModel
    func update(viewModel: ViewModel?)
}

extension ViewModelRepresentable {
    public func update(anyViewModel: Any?) {
        if let viewModel = anyViewModel as? ViewModel {
            update(viewModel: viewModel)
        } else {
            fatalError("Invalid view model")
        }
    }
}
