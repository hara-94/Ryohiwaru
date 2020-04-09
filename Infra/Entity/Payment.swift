//
//  Payment.swift
//  Infra
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public final class Payment {
    public let category: String
    public let money: Int
    public let name: String
    
    init(category: String, money: Int, name: String) {
        self.category = category
        self.money = money
        self.name = name
    }
    
    public static func sample() -> Payment {
        return Payment(category: .paymentsStringSample, money: Int.random(in: 1...10000), name: "name")
    }
}
