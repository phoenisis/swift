//
//  UITableViewHeaderFooterView+Theme.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 07/02/2020.
//  Copyright © 2020 Utils. All rights reserved.
//

import UIKit

extension UITableViewHeaderFooterView {
	
	func setGlobalTheme() {
		self.textLabel?.theme(.sectionHeader)
		self.textLabel?.text?.capitalizeFirstLetter()
		self.backgroundColor = .clear
	}
}
