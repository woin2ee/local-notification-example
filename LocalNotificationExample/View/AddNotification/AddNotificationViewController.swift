//
//  AddNotificationViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit
import SnapKit

protocol NotificationTableViewDelegate: AnyObject {
    func append(_ date: DateComponents)
}

class AddNotificationViewController: UIViewController {
    
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
    
    private let calendar: Calendar = {
        var calendar = Calendar.current
        calendar.timeZone = .init(abbreviation: "KST") ?? TimeZone.autoupdatingCurrent
        return calendar
    }()
    
    private weak var notificationTableViewDelegate: NotificationTableViewDelegate?
    
    // MARK: - Initializers
    
    init(notificationTableViewDelegate: NotificationTableViewDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.notificationTableViewDelegate = notificationTableViewDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    // MARK: - Private
    
    private func initView() {
        self.view.backgroundColor = .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        initNavigationBar()
        placeDatePickerOnRootView()
    }
    
    private func initNavigationBar() {
        setupTitle()
        setupBarButton()
    }
    private func setupTitle() {
        self.navigationController?.navigationBar.topItem?.titleView = titleLabel
    }
    private func setupBarButton() {
        saveButton.primaryAction = UIAction { _ in
            let dateComponents = self.calendar.dateComponents([.hour, .minute], from: self.datePicker.date)
            self.notificationTableViewDelegate?.append(dateComponents)
            self.dismiss(animated: true)
        }
        self.navigationItem.rightBarButtonItem = saveButton
        
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
}
