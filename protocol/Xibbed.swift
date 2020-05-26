//
//  Xibbed.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 04/03/2019.
//  Copyright © 2019 Utils. All rights reserved.
//

import UIKit

protocol Xibbed {
    static func instantiate() -> Self
}

extension Xibbed where Self: UIView {
    static func instantiate() -> Self {
        let fullName: String = NSStringFromClass(self)
        let className: String = fullName.components(separatedBy: ".")[1]
        return (Bundle.main.loadNibNamed(className, owner: nil, options: nil) as! [UIView]).first as! Self
    }
}
