//
//  Array+Extension.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 13/06/2017.
//  Copyright © 2017 Connectiv'IT. All rights reserved.
//

import Foundation

extension Array {
    
    func item(at index: Int) -> Element? {
        index < count ? self[index] : nil
    }
    
}
