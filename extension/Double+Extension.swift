//
//  Double+Extension.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 13/06/2017.
//  Copyright © 2017 Connectiv'IT. All rights reserved.
//

import Foundation

extension Double {
  var clean: String {
     return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
  }
}