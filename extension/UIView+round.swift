//
//  UIView+round.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 19/10/2018.
//  Copyright © 2018 Utils. All rights reserved.
//

import UIKit

extension UIView {
	/// Create a circle view with a white border
	///
	/// Important, you need to have a square view
	func circle() {
		layer.borderWidth = 3.0
		layer.borderColor = UIColor.white.cgColor
		
		layer.cornerRadius = frame.size.height/2
		clipsToBounds = true
	}

	func round() {
		layer.cornerRadius = frame.size.height/2
		clipsToBounds = true
	}
}