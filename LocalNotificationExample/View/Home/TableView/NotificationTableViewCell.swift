//
//  NotificationTableViewCell.swift
//  LocalNotificationExample
//
//  Created by Jaewon on 2022/06/28.
//

import UIKit
import SnapKit

class NotificationTableViewCell: UITableViewCell {
    
    var dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 22)
        return lbl
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func initCell() {
        self.contentView.backgroundColor = .black
        placeDateLabelOnCell()
    }
    
    private func placeDateLabelOnCell() {
        self.contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.left.equalTo(self.contentView)
        }
    }
}
