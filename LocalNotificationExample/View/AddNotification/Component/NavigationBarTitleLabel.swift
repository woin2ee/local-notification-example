//
//  NavigationBarTitleLabel.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

struct NavigationBarTitleLabel {
    
    private static var label = UILabel()
    
    static func to() -> UILabel {
        label.text = "알림 추가"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }
}
