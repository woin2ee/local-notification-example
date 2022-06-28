//
//  AddBarButtonItem.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

struct AddBarButtonItem {
    
    private static var button = UIBarButtonItem()
    
    static func to(_ handler: @escaping UIActionHandler) -> UIBarButtonItem {
        button = UIBarButtonItem(systemItem: .add)
        button.tintColor = .orange
        button.primaryAction = UIAction(handler: handler)
        return button
    }
}
