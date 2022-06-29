//
//  NotificationTableViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

protocol HomeDelegate: AnyObject {
    func presentToHome(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

struct CellDTO {
    let id: UUID
    var date: DateComponents
}

class NotificationTableViewController: UITableViewController {
    
    private var notificationList: [CellDTO] = []
    
    private weak var homeDelegate: HomeDelegate?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    func bind(homeDelegate: HomeDelegate) {
        self.homeDelegate = homeDelegate
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
        
        let hour = notificationList[indexPath.row].date.hour ?? 0
        let minute = notificationList[indexPath.row].date.minute ?? 0
        
        let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
        let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
        
        cell.dateLabel.text = hourString + ":" + minuteString
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.homeDelegate?.presentToHome(
            UINavigationController(rootViewController: AddNotificationViewController(
                id: self.notificationList[indexPath.row].id,
                date: Date.to(notificationList[indexPath.row].date) ?? Date(),
                notificationTableViewDelegate: self
            )),
            animated: true,
            completion: nil
        )
    }
}

// MARK: - NotificationTableViewDelegate

extension NotificationTableViewController: NotificationTableViewDelegate {
    
    func save(id: UUID?, date: DateComponents) {
        if id == nil {
            self.notificationList.append(CellDTO(id: UUID(), date: date))
        } else {
            guard let id = id else { return }

            self.notificationList.removeAll(where: { $0.id == id })
            self.notificationList.append(CellDTO(id: id, date: date))
        }
        self.tableView.reloadData()
    }
}
