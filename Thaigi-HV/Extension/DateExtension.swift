//
//  DateExtensiion.swift
//  tripbay_ios
//
//  Created by Rock on 2019/9/2.
//  Copyright © 2019 TripBay. All rights reserved.
//

import Foundation

extension Date {
    private static let formatter:DateFormatter = {
//        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        
//        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        return formatter
    }()
    
    func toString(_ dateFormat:String = "yyyy-MM-dd") -> String {
        
        Self.formatter.dateFormat = dateFormat
        
        let date = Self.formatter.string(from: self)
        
        return date.components(separatedBy: " ").first!
    }
    init(
        era: Int, year: Int, month: Int,
        day: Int, second: Int,
        calendar:Calendar
    ) {
        let c = DateComponents(era: era, year: year, month: month, day: day, second: second)
        guard let d = calendar.date(from: c) else {
            preconditionFailure("""
                Failed to create a `Date` representing the day of era\(era) \(year)/\(month)/\(day) in calendar: \(calendar)
                """)
        }
        self = d
    }
    func description(format:String) -> String {
        
        Self.formatter.dateFormat = format
        
        let date = Self.formatter.string(from: self)
        
        return date.components(separatedBy: " ").first!
    }
    var month:Int {
        Int(self.description(format: "MM")) ?? 0
    }
    var year:Int {
        Int(self.description(format: "yyyy")) ?? 0
    }
    
    func timeToString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    static func getCurrentTimeString(dateFormat: String) -> String {
        let currentTimestamp = Date().timeIntervalSince1970
        let currentTimeInterval = TimeInterval(currentTimestamp)
        let currentTime = Date(timeIntervalSince1970: TimeInterval(currentTimeInterval))
        return currentTime.timeToString(dateFormat: dateFormat)
    }
    
}


extension TimeInterval {
    static var min:TimeInterval {60}
    static var hour:TimeInterval {.min * 60}
    static var day:TimeInterval {.hour * 24}
}

