//
//  HomeViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private let addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(systemItem: .add)
        button.tintColor = .orange
        return button
    }()
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "알림"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let notificationTableViewController = NotificationTableViewController()
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        notificationTableViewController.bind(homeDelegate: self)
    }
    
    // MARK: - Private
    
    private func initView() {
        self.view.backgroundColor = .black
        initNavigationBar()
        placeHeaderLabelOnRootView()
        placeTableViewOnRootView()
    }
    
    private func initNavigationBar() {
        setupBarButton()
    }
    private func setupBarButton() {
        addButton.primaryAction = UIAction { _ in
            self.present(
                UINavigationController(rootViewController: AddNotificationViewController(notificationTableViewDelegate: self.notificationTableViewController)),
                animated: true
            )
        }
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    private func placeHeaderLabelOnRootView() {
        self.view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
    }
    private func placeTableViewOnRootView() {
        self.view.addSubview(notificationTableViewController.tableView)
        notificationTableViewController.tableView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(20)
            $0.bottom.left.right.equalTo(self.view.safeAreaLayoutGuide).offset(10)
        }
    }
}

// MARK: - HomeDelegate

extension HomeViewController: HomeDelegate {
    
    func presentToHome(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.present(viewControllerToPresent, animated: flag)
    }
}
