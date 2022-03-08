//
//  UIColor+Extension.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 03/03/2022.
//

import Foundation
import UIKit

extension UIColor {
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func colorWithRGB(red: UInt, green: UInt, blue: UInt) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0,
                       green: CGFloat(green)/255.0,
                       blue: CGFloat(blue)/255.0,
                       alpha: 1.0)
    }
    
    static func HEXCOLOR(_ c: UInt32) -> UIColor! {
        let red = CGFloat(CGFloat(( c >> 16 ) & 0xFF ) / 255.0)
        let green = CGFloat(CGFloat(( c >> 8 ) & 0xFF ) / 255.0)
        let blue = CGFloat(CGFloat(c & 0xFF)/255.0)
        return UIColor(red: red, green: green, blue:blue, alpha: 1.0)
    }
}

extension UIColor {
    static let black_151A = UIColor.HEXCOLOR(0x15151A)!
}
