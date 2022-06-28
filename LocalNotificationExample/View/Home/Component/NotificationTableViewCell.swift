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
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .black
        
        self.contentView.addSubview(dateLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        dateLabel.snp.makeConstraints {
            $0.left.equalTo(self.contentView)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
