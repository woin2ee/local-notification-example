//
//  Date+.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/29.
//

import Foundation

extension Date {
    
    static func to(_ dateComponents: DateComponents) -> Date? {
        guard
            let _hour = dateComponents.hour,
            let _minute = dateComponents.minute
        else { return nil }
        
        let hour = _hour < 10 ? "0\(_hour)" : "\(_hour)"
        let minute = _minute < 10 ? "0\(_minute)" : "\(_minute)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .init(abbreviation: "KST")
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.date(from: "\(hour):\(minute)")
    }
}
