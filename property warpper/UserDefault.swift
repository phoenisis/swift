//
//  UserDefault.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 13/06/2017.
//  Copyright © 2017 Connectiv'IT. All rights reserved.
//

import Foundation

private protocol AnyOptional {
	var isNil: Bool { get }
}

extension Optional: AnyOptional {
	var isNil: Bool { self == nil }
}

@propertyWrapper struct UserDefault<Value> {
	let key: String
	let defaultValue: Value
	var storage: UserDefaults = .standard
	
	var wrappedValue: Value {
		get {
			let value = storage.value(forKey: key) as? Value
			return value ?? defaultValue
		}
		set {
			if let optional = newValue as? AnyOptional, optional.isNil {
				storage.removeObject(forKey: key)
			} else {
				storage.setValue(newValue, forKey: key)
				storage.synchronize()
			}
		}
	}
}

extension UserDefault where Value: ExpressibleByNilLiteral {
	init(key: String, storage: UserDefaults = .standard) {
		self.init(key: key, defaultValue: nil, storage: storage)
	}
}

//Usage
struct SettingsViewModel {
	@UserDefault(key: "mark-as-read", defaultValue: false)
	var autoMarkMessagesAsRead: Bool
	
	@UserDefault(key: "search-page-size")
	var numberOfSearchResultsPerPage: Int?
}