//
//  Validator+Password.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 13/06/2017.
//  Copyright © 2017 Utils. All rights reserved.
//

import Foundation

extension Validator where Value == String {
  static var password: Validator {
    return Validator { string in
      try validate(
        string.count >= 8,
        errorMessage: "Password must contain min 8 characters"
      )
      try validate(
        string.lowercased() != string,
        errorMessage: "Password must contain an uppercased character"
      )
      try validate(
        string.uppercased() != string,
        errorMessage: "Password must contain an lowercased character"
      )
      try validate(
        string.rangeOfCharacter(from: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789").inverted) != nil,
        errorMessage: "Password must contain a special character"
      )
    }
  }
}