///https://www.swiftbysundell.com/articles/property-wrappers-in-swift/

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

//Usage
struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}