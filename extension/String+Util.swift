//
//  String+Utils.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 07/11/2018.
//  Copyright © 2018 Utils. All rights reserved.
//

import Foundation

extension String: Error {}

extension String {

  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }

  subscript (i: Int) -> String {
    return String(self[i] as Character)
  }

  private func replace(_ of: String, with: String) -> String {
    return self.replacingOccurrences(of: of, with: with)
  }
	
	func capitalizingFirstLetter() -> String {
		return prefix(1).uppercased() + self.lowercased().dropFirst()
	}
	
	mutating func capitalizeFirstLetter() {
		self = self.capitalizingFirstLetter()
	}

  var insecableSpace: String {
    return self.replace(" ", with: "\u{00a0}")
  }

  var localized: String {
    return self.localized()
  }

  var isValidPassword: Bool {
    //number of caractere min
    if self.count > 7 {
      //have lowercased charactere
      if self.lowercased() == self || self.uppercased() == self {
        return false
      } else {
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
          return true
        } else {
          return false
        }
      }

    } else {
      return false
    }
  }

  var packaged: String {
    if let identifier = Bundle.main.bundleIdentifier {
        return "\(identifier).\(self)"
    } 

    return self
  }

  func convertHtml(_ css: String?) -> NSAttributedString {
    var text = self

    if let css = css {
      text = css + self
    }

    guard let data = text.data(using: .utf8) else { return NSAttributedString() }
    do{
      return try NSAttributedString(data: data, options: [
        NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
        NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil)
    }catch{
      return NSAttributedString()
    }
  }
}
