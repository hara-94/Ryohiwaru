//
//  Payment.swift
//  Infra
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Util

public final class Payment {
    public let category: String
    public let money: String
    public let name: String
    
    init(category: String, money: String, name: String) {
        self.category = category
        self.money = money
        self.name = name
    }
    
    public static func sample() -> Payment {
        return Payment(category: .paymentsStringSample, money: Int.random(in: 1...10000).makeStringWithComma(), name: "name")
    }
}
