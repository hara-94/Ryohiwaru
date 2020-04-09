//
//  InputUseCase.swift
//  Infra
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public protocol InputUseCase {
    init()
    
    func getPayments() -> [Payment]
}

public struct InputDemoInteractor: InputUseCase {
    public init() { }
    
    public func getPayments() -> [Payment] {
        let range = Int.random(in: 0...15)
        var subject: [Payment] = []
        for _ in 1...range {
            let payment = Payment.sample()
            subject.append(payment)
        }
        return subject
    }
}
