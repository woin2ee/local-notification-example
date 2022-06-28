//
//  AddNotificationViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit

class AddNotificationViewController: UIViewController {
    
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
    }
    
    private func initView() {
        self.view.backgroundColor = .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        initNavigationBar()
        
        
        
        let datePicker: UIDatePicker = {
            let datePicker = UIDatePicker()
            
            return datePicker
        }()
    }
    
    private func initNavigationBar() {
        setupTitle()
        setupBarButton()
    }
    
    private func setupTitle() {
        let titleLabel: UILabel = {
            let title = UILabel()
            title.text = "알림 추가"
            title.textColor = .white
            title.font = .boldSystemFont(ofSize: 16)
            return title
        }()
        self.navigationController?.navigationBar.topItem?.titleView = titleLabel
    }
    
    private func setupBarButton() {
        let saveBarButton: UIBarButtonItem = {
            let button = UIBarButtonItem(systemItem: .save)
            button.primaryAction = UIAction { _ in
                print("Save")
            }
            button.tintColor = .orange
            return button
        }()
        self.navigationItem.rightBarButtonItem = saveBarButton
        
        let cancelBarButton: UIBarButtonItem = {
            let button = UIBarButtonItem(systemItem: .cancel)
            button.primaryAction = UIAction { _ in
                self.dismiss(animated: true)
            }
            button.tintColor = .orange
            return button
        }()
        self.navigationItem.leftBarButtonItem = cancelBarButton
    }
}
