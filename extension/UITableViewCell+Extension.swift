//
//  UITableViewCell+Extension.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 13/06/2017.
//  Copyright © 2017 Connectiv'IT. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func hideSeparator() {
        let width: CGFloat = UIScreen.main.bounds.width
        separatorInset = UIEdgeInsets(top: 0.0, left: width / 2.0, bottom: 0.0, right: width / 2.0)
    }
    
}
