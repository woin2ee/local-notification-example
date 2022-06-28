//
//  NotificationTableViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    
    var notificationList: [Date] = [Date(), Date()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "notificationCell")
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell") as! NotificationTableViewCell
        
        cell.dateLabel.text = notificationList[indexPath.row].description
        
        return cell
    }
}
