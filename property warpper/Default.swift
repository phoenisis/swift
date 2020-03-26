import Foundation

private protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}

@propertyWrapper struct Default<Value> {
    let key: String
    var storage: UserDefaults = .standard

    var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value }
        set { 
            if let optional = newValue as? AnyOptional, optional.isNil {
                storage.removeObject(forKey: key)
            } else {
                storage.setValue(newValue, forKey: key)
            }
         }
    }
}

extension Default where Value: ExpressibleByNilLiteral {
    init(key: String, storage: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, storage: storage)
    }
}


//Usage
struct SettingsViewModel {
    @UserDefaultsBacked(key: "mark-as-read", defaultValue: false)
    var autoMarkMessagesAsRead: Bool

    @UserDefaultsBacked(key: "search-page-size")
    var numberOfSearchResultsPerPage: Int?
}