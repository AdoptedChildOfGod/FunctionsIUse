//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import Foundation

extension Date {
    func components(_ components: Set<Calendar.Component>) -> DateComponents {
        return Calendar.current.dateComponents(components, from: self)
    }

    func component(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }

    var era: Int { return component(.era) }
    var year: Int { return component(.year) }
    var month: Int { return component(.month) }
    var day: Int { return component(.day) }
    var hour: Int { return component(.hour) }
    var minute: Int { return component(.minute) }
    var second: Int { return component(.second) }
    var weekday: Int { return component(.weekday) }
    var weekdayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    var weekdayOrdinal: Int { return component(.weekdayOrdinal) }
    var quarter: Int { return component(.quarter) }
    var weekOfMonth: Int { return component(.weekOfMonth) }
    var weekOfYear: Int { return component(.weekOfYear) }
    var yearForWeekOfYear: Int { return component(.yearForWeekOfYear) }
    var nanosecond: Int { return component(.nanosecond) }
    var calendar: Calendar? { return components([.calendar]).calendar }
    var timeZone: TimeZone? { return components([.timeZone]).timeZone }
    
    var daysInCurrentMonth: Int? {
        let calendar = Calendar.current
        guard let date = calendar.date(from: components([.year, .month])) else { return nil }
        
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return nil }
        
        return range.count
    }
    var daysInCurrentYear: Int? { return Calendar.current.range(of: .day, in: .year, for: Date())?.count }
}
