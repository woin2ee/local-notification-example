//
//  NotificationTableViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    
    var notificationList: [Date] = [Date(), Date()]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    // MARK: - Private
    
    private func initTableView() {
        tableView.backgroundColor = .black
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
        
        cell.dateLabel.text = notificationList[indexPath.row].description
        
        return cell
    }
}
