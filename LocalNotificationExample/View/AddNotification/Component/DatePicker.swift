//
//  DatePicker.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

struct DatePicker {
    
    private static var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.locale = .autoupdatingCurrent
        datePicker.setValue(UIColor.white, forKey: "textColor")
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    static func to(date: Date = Date()) -> UIDatePicker {
        datePicker.date = date
        return datePicker
    }
}
