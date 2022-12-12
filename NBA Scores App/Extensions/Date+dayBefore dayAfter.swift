//
//  Date+dayBefore dayAfter.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 11/12/2022.
//

import Foundation

extension Date {
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
}
