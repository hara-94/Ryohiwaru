//
//  PresenterEventReactable.swift
//  Wireframe
//
//  Created by 原ひかる on 2020/04/04.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public protocol AnyPresenterEventReactable {
    func on(anyEvent: Any?)
}

public protocol PresenterEventReactable: AnyPresenterEventReactable {
    associatedtype PresenterEvent
    
    func on(event: PresenterEvent)
}

extension PresenterEventReactable {
    public func on(anyEvent: Any?) {
        if let anyEvent = anyEvent as? PresenterEvent {
            on(event: anyEvent)
        } else {
            fatalError("Invalid presenter")
        }
    }
}
