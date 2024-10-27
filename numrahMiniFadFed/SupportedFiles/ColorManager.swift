//
//  ColorManager.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 27/10/24.
//

import UIKit

// Custom Color Enum Class
enum Color {
    case clrActiveButton
    case clrBackground
    case clrErrorMsg
    case clrText
    case clrYellow
    case clrViewBg
    case clrViewOuterGender

    
    case custom(hexString: String, alpha: Double)
    
    func with(alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

// Extended Color Class
extension Color {
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .clrActiveButton:
            instanceColor = UIColor(named: "clrActiveButton") ?? UIColor.clear
        case .clrBackground:
            instanceColor = UIColor(named: "clrBackground") ?? UIColor.clear
        case .clrErrorMsg:
            instanceColor = UIColor(named: "clrErrorMsg") ?? UIColor.clear
        case .clrText:
            instanceColor = UIColor(named: "clrText") ?? UIColor.clear
        case .clrYellow:
            instanceColor = UIColor(named: "clrYellow") ?? UIColor.clear
        case .clrViewBg:
            instanceColor = UIColor(named: "clrViewBg") ?? UIColor.clear
        case .clrViewOuterGender:
            instanceColor = UIColor(named: "clrViewOuterGender") ?? UIColor.clear
            
            
            
            
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
}

extension UIColor {
    // Initialize UIColor from a hex string
    convenience init(hexString: String) {
        var hexFormatted = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Ensure the string has a valid length
        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
