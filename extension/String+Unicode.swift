//
//  String+Unicode.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 20/11/2018.
//  Copyright © 2018 Utils. All rights reserved.
//

import Foundation

extension String {
	var withUnicodeEmojis: String {
		get {
			do {
				let regex = try NSRegularExpression(pattern: "(U\\+([0-9A-F]+))", options: .caseInsensitive)
				var newString = ""
				for (index, str) in self.components(separatedBy: " ").enumerated() {
					let results = regex.matches(in: str, options: [], range: NSRange(str.startIndex..., in: str))
					
					if results.count > 0 {
						for item in results {
							let emojiStr = String(str[Range(item.range, in: str)!])
							if let int = Int(emojiStr.replacingOccurrences(of: "U+", with: ""), radix: 16) {
								if let scalar = UnicodeScalar(int) {
									let string = String(scalar)
									if index == 0 {
										newString += string
									} else {
										newString += " \(string)"
									}
								}
							}
						}
					} else {
						newString += index == 0 ? str : " \(str)"
					}
				}
				return newString
			} catch  {
				return self
			}
		}
	}
}
