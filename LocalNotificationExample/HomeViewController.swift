//
//  HomeViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        addButton()
    }
    
    func addButton() {
        let createNotificationButton = UIButton(type: .system)
        createNotificationButton.setTitle("알림 등록", for: .normal)
        createNotificationButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(createNotificationButton)
        
        NSLayoutConstraint.activate([
            createNotificationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            createNotificationButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
