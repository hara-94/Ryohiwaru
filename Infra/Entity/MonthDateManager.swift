//
//  MonthDateManager.swift
//  Infra
//
//  Created by 原暉 on 2020/04/14.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation

public final class MonthDateManager {
    private var calendar = Calendar.current
    private (set) var days: [Date] = []
    private var firstDate: Date! {
        didSet {
            days = createDaysForMonth()
        }
    }
    
    var monthString: String {
        return firstDate.makeString(format: "yyyy/MM")
    }
    
    public init() {
        var component = calendar.dateComponents([.year, .month], from: Date())
        component.day = 1
        firstDate = calendar.date(from: component)
        days = createDaysForMonth()
    }
    
    func createDaysForMonth() -> [Date] {
        let dayOfTheWeek = calendar.component(.weekday, from: firstDate) - 1
        let numberOfWeeks = calendar.range(of: .weekOfMonth, in: .month, for: firstDate)!.count
        let numberOfItems = numberOfWeeks * 7
        
        return (0..<numberOfItems).map { i in
            var dateComponents = DateComponents()
            dateComponents.day = i - dayOfTheWeek
            print(dateComponents)
            return calendar.date(byAdding: dateComponents, to: firstDate)!
        }
    }
    
    public func nextMonth() {
        firstDate = calendar.date(byAdding: .month, value: 1, to: firstDate)
    }
       
    public func prevMonth() {
        firstDate = calendar.date(byAdding: .month, value: -1, to: firstDate)
    }
}
