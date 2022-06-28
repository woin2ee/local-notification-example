//
//  DatePicker.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

struct DatePicker {
    
    private static var datePicker = UIDatePicker()
    
    static func to() -> UIDatePicker {
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.locale = .autoupdatingCurrent
        datePicker.setValue(UIColor.white, forKey: "textColor")
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }
}
