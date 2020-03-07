//
//  Int+Utils.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 13/06/2017.
//  Copyright © 2017 Connectiv'IT. All rights reserved.
//

import Foundation

extension Int{
	static prefix func ++(x: inout Int) -> Int {
		x += 1
		return x
	}
	
	static postfix func ++(x: inout  Int) -> Int {
		defer {x += 1}
		return x
	}
	
	static prefix func --(x: inout Int) -> Int {
		x -= 1
		return x
	}
	
	static postfix func --(x: inout Int) -> Int {
		defer {x -= 1}
		return x
	}
	
	func hasFlag(_ flag: Int) -> Bool {
		/// flag usage 1 << index
		return (self & flag == flag)
	}
	
	func hasNotFlag(_ flag: Int) -> Bool {
		/// flag usage 1 << index
		return !self.hasFlag(flag)
	}
}