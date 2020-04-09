//
//  String+Sample.swift
//  Infra
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

extension String {
    static var paymentStringSamples: [String] {
        return [
            "食費",
            "交通費",
            "宿泊費",
            "観光費",
            "お土産",
            "その他",
        ]
    }
    
    static var paymentsStringSample: String { return paymentStringSamples.lazy.randomElement()!}
}
