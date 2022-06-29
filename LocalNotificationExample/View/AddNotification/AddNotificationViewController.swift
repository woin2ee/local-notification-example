//
//  AddNotificationViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit
import SnapKit

protocol NotificationTableViewDelegate: AnyObject {
    func save(id: UUID?, date: DateComponents)
}

class AddNotificationViewController: UIViewController {
    
    private let notificationCenter: UNUserNotificationCenter
    
    private weak var notificationTableViewDelegate: NotificationTableViewDelegate?
    
    private let calendar: Calendar = {
        var calendar = Calendar.current
        calendar.timeZone = .init(abbreviation: "KST") ?? TimeZone.autoupdatingCurrent
        return calendar
    }()
    
    private let id: UUID?
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.timeZone = .init(abbreviation: "KST")
        datePicker.locale = .init(identifier: "ko_KR")
        datePicker.setValue(UIColor.white, forKey: "textColor")
        return datePicker
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "알림 추가"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    private let saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(systemItem: .save)
        button.tintColor = .orange
        return button
    }()
    private let cancelButton: UIBarButtonItem = {
        let button = UIBarButtonItem(systemItem: .cancel)
        button.tintColor = .orange
        return button
    }()
    
    // MARK: - Initializers
    
    init(
        id: UUID? = nil,
        date: Date = Date(),
        notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current(),
        notificationTableViewDelegate: NotificationTableViewDelegate
    ) {
        self.id = id
        self.datePicker.setDate(date, animated: false)
        self.notificationCenter = notificationCenter
        self.notificationTableViewDelegate = notificationTableViewDelegate
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
        self.view.backgroundColor = .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        initNavigationBar()
        placeDatePickerOnRootView()
    }
    
    private func initNavigationBar() {
        setupTitle()
        setupRightBarButton()
        setupLeftBarButton()
    }
    private func setupTitle() {
        self.navigationController?.navigationBar.topItem?.titleView = titleLabel
    }
    private func setupRightBarButton() {
        saveButton.primaryAction = UIAction { _ in
            let dateComponents = self.calendar.dateComponents([.hour, .minute], from: self.datePicker.date)
            self.notificationTableViewDelegate?.save(id: self.id, date: dateComponents)
            self.dismiss(animated: true)
            
            self.addNotification(time: dateComponents)
        }
        self.navigationItem.rightBarButtonItem = saveButton
    }
    private func setupLeftBarButton() {
        cancelButton.primaryAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    private func placeDatePickerOnRootView() {
        self.view.addSubview(datePicker)
        datePicker.snp.makeConstraints {
            $0.centerX.width.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func addNotification(time: DateComponents) {
        let notificationContent: UNMutableNotificationContent = {
            let content = UNMutableNotificationContent()
            content.title = "알림"
            content.subtitle = "정해진 시간이 됐습니다."
            content.body = ""
            content.sound = .default
            content.badge = 0
            return content
        }()
        
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: time, repeats: true)
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
        }
    }
}
