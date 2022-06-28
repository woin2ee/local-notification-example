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
        self.navigationController?.navigationBar.topItem?.titleView = NavigationBarTitleLabel.to()
    }
    
    private func setupBarButton() {
        self.navigationItem.rightBarButtonItem = SaveBarButtonItem.to { _ in
            print("Save")
        }
        
        self.navigationItem.leftBarButtonItem = CancelBarButtonItem.to { _ in
            self.dismiss(animated: true)
        }
    }
}
