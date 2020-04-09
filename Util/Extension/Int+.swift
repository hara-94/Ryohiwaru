//
//  Int+.swift
//  Util
//
//  Created by 原暉 on 2020/04/10.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public extension Int {
    func makeStringWithComma() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSize = 3
        formatter.groupingSeparator = ","
        if let result = formatter.string(from: NSNumber(value: self)) {
            return result
        } else {
            fatalError("Cannot convert to String")
        }
    }
}
