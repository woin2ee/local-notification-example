//
//  AddNotificationViewController.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit
import SnapKit

class AddNotificationViewController: UIViewController {
    
    private var datePicker = DatePicker.to()
    
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
        
        
        self.view.addSubview(datePicker)
        
        datePicker.snp.makeConstraints {
            $0.centerX.width.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
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
            
        }
        
        self.navigationItem.leftBarButtonItem = CancelBarButtonItem.to { _ in
            self.dismiss(animated: true)
        }
    }
}
