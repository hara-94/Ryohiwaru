//
//  Travel.swift
//  Infra
//
//  Created by 原ひかる on 2020/04/26.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public class Travel {
    public let title: String
    public let startDate: String
    public let endDate: String
    public let allPayments: Int
    
    public init(title: String, startDate: String, endDate: String, allPayments: Int) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.allPayments = allPayments
    }
}
