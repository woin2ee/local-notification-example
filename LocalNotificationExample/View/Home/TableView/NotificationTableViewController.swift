//
//  NotificationTableViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    
    private var notificationList: [DateComponents] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    // MARK: - Private
    
    private func initTableView() {
        tableView.backgroundColor = .black
        
        tableView.separatorColor = .systemGray4
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "NotificationCell")
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension NotificationTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationTableViewCell
        
        let hour = notificationList[indexPath.row].hour ?? 0
        let minute = notificationList[indexPath.row].minute ?? 0
        
        let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
        let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
        
        cell.dateLabel.text = hourString + ":" + minuteString
        
        return cell
    }
}

extension NotificationTableViewController: NotificationTableViewDelegate {
    
    func append(_ date: DateComponents) {
        self.notificationList.append(date)
        self.tableView.reloadData()
    }
}
