//
//  Colors+Extension.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 13/06/2017.
//  Copyright © 2017 Utils. All rights reserved.
//

import UIKit
extension UIColor {
    /// Initializes and returns a color object using the specified opacity and Hexadecimal color string component values.
    ///
    /// - Parameters:
    ///   - hex: The Hexadecimal color string value of the color object, specified as a value without the # caractere
    ///   - alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0. Alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0
    convenience init(hex: String, alpha: Double = 1.0) {
        let h = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: h).scanHexInt32(&int)
        let r, g, b: UInt32
        
        switch h.characters.count {
        case 3:
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(255 * alpha) / 255)
    }
}

