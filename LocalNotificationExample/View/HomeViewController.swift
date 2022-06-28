//
//  HomeViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let notificationCenter: UNUserNotificationCenter
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Initializers
    
    init(notificationCenter: UNUserNotificationCenter) {
        self.notificationCenter = notificationCenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        requestNotificationAuthorization()
    }
    
    // MARK: - Private
    
    private func initView() {
        self.view.backgroundColor = .black
        initNavigationBar()
        addButton()
    }
    
    private func initNavigationBar() {
        addBarButton()
    }
    
    private func addBarButton() {
        let addBarButton = UIBarButtonItem(
            systemItem: .add,
            primaryAction: UIAction { _ in
                print("Add")
            }
        )
        self.navigationItem.setRightBarButton(addBarButton, animated: true)
    }
    
    private func addButton() {
        let buttonConfig: UIButton.Configuration = {
            var config = UIButton.Configuration.filled()
            config.title = "알림 등록"
            return config
        }()
        
        let createNotificationButton = UIButton(
            configuration: buttonConfig,
            primaryAction: UIAction { _ in
                self.addNotification()
            }
        )
        
        self.view.addSubview(createNotificationButton)
        
        createNotificationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createNotificationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            createNotificationButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    private func addNotification() {
        let notificationContent: UNMutableNotificationContent = {
            let content = UNMutableNotificationContent()
            content.title = "Title"
            content.subtitle = "subtitle"
            content.body = "body"
            content.sound = .default
            content.badge = 1
            return content
        }()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: notificationContent,
            trigger: trigger
        )
        notificationCenter.add(request) { error in
            if let _ = error {
                self.showDefaultAlert(title: "알림", message: "푸시 알림이 등록되지 않았습니다.")
            }
        }
    }
    
    private func showDefaultAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    private func requestNotificationAuthorization() {
        let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter.requestAuthorization(options: authOptions) { isAllowed, error in
            if let error = error {
                return debugPrint(error.localizedDescription)
            }
            
            self.showDefaultAlert(title: "알림 허용 여부", message: isAllowed.description)
        }
    }
}
