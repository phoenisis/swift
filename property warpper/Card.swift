import UIKit

@propertyWrapper class Card {
    var wrappedValue: UIView
    
    init(wrappedValue: UIView) {
        self.wrappedValue = wrappedValue
        applyCornerRadius()
        applyCardShadow()
    }
    
    private func applyCardShadow() {
        applySubtleShadow()
    }
    
    private func applySubtleShadow() {
        let layer = wrappedValue.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.35
    }
    
    private func applyCornerRadius(_ radius: CGFloat = 8, forCorners cornerMask: CACornerMask = .all) {
        let layer = wrappedValue.layer
        layer.cornerCurve = .continuous
        layer.cornerRadius = radius
        layer.maskedCorners = cornerMask
    }
}


// Usage
@Card()
var header = UIView()