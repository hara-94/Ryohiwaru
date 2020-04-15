//
//  Date+.swift
//  Util
//
//  Created by 原暉 on 2020/04/14.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public extension Date {
    func makeString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
