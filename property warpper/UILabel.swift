@propertyWrapper
class Title {
    var wrappedValue: UILabel
    
    init(text: String) {
        self.wrappedValue = UILabel()
        wrappedValue.text = text
    }
    
    private func configureLabel() {
        wrappedValue.font = UIFont.preferredFont(forTextStyle: .title1)
        wrappedValue.textColor = UIColor(named: "textColor")
        wrappedValue.numberOfLines = 1
    }
}


// Usage
@Title(text: "Home")
var titleLabel: UILabel