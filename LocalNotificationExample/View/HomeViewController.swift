//
//  HomeViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var notificationCenter: UNUserNotificationCenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.notificationCenter = UNUserNotificationCenter.current()
        
        requestNotificationAuthorization()
        
        initView()
    }
    
    func initView() {
        self.view.backgroundColor = .white
        
        addButton()
    }
    
    func addButton() {
        let createNotificationButton = UIButton(type: .system)
        createNotificationButton.setTitle("알림 등록", for: .normal)
        createNotificationButton.addAction(
            UIAction { _ in
                self.addNotification()
            },
            for: .touchUpInside
        )
        
        createNotificationButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(createNotificationButton)
        
        NSLayoutConstraint.activate([
            createNotificationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            createNotificationButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    func addNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "subtitle"
        content.body = "body"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        notificationCenter?.add(request) { error in
            if let _ = error {
                self.showDefaultAlert(title: "알림", message: "푸시 알림이 등록되지 않았습니다.")
            }
        }
    }
    
    func showDefaultAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func requestNotificationAuthorization() {
        let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter?.requestAuthorization(options: authOptions) { isAllowed, error in
            if let error = error {
                return debugPrint(error.localizedDescription)
            }
            
            self.showDefaultAlert(title: "알림 허용 여부", message: isAllowed.description)
        }
    }
}
