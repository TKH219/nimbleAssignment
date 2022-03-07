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
    static let appTheme = UIColor.HEXCOLOR(0xf0f0f0)!
    static let orange = UIColor.HEXCOLOR(0xffb248)!
    static let highlight = UIColor.HEXCOLOR(0x306ee9)!
    static let navigationBar = UIColor.HEXCOLOR(0x3778EC)!
    static let grayBar = UIColor.HEXCOLOR(0xf3f6f8)!
    static let greenLight = UIColor.HEXCOLOR(0x7ED321)!
    static let disabled = UIColor.HEXCOLOR(0x696969)!
    static let gray_900 = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1) //111111
    static let gray_e5e5 = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1) //E5E5E5
    static let gray_500 = #colorLiteral(red: 0.3803921569, green: 0.431372549, blue: 0.4862745098, alpha: 1) //616E7C
    static let gray_2933 = #colorLiteral(red: 0.1215686275, green: 0.1607843137, blue: 0.2, alpha: 1) //1F2933
    static let gray_7782 = #colorLiteral(red: 0.4235294118, green: 0.4666666667, blue: 0.5098039216, alpha: 1) //6C7782
    static let gray_464E = #colorLiteral(red: 0.2470588235, green: 0.2745098039, blue: 0.3058823529, alpha: 1) //3F464E
    static let gray_300 = #colorLiteral(red: 0.6039215686, green: 0.6470588235, blue: 0.6941176471, alpha: 1) //9AA5B1
    static let gray_9797 = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1) //979797
    static let gray_100 = #colorLiteral(red: 0.8941176471, green: 0.9058823529, blue: 0.9215686275, alpha: 1) //E4E7EB
    static let gray_4343 = #colorLiteral(red: 0.262745098, green: 0.262745098, blue: 0.262745098, alpha: 1) //434343
    static let gray_8b8b = #colorLiteral(red: 0.5450980392, green: 0.5450980392, blue: 0.5450980392, alpha: 1) //8B8B8B
    static let gray_3f47 = #colorLiteral(red: 0.2470588235, green: 0.2470588235, blue: 0.2784313725, alpha: 1) //3F3F47
    static let gray_606d = #colorLiteral(red: 0.3215686275, green: 0.3764705882, blue: 0.4274509804, alpha: 1) //52606D
    static let gray_5656 = #colorLiteral(red: 0.3215686275, green: 0.3764705882, blue: 0.4274509804, alpha: 1) //565656
    static let gray_cbcb = #colorLiteral(red: 0.7960784314, green: 0.7960784314, blue: 0.7960784314, alpha: 1) //565656
    static let gray_7272 = #colorLiteral(red: 0.4470588235, green: 0.4470588235, blue: 0.4470588235, alpha: 1) //727272
    static let gray_f2f2 = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1) //F2F2F2
    static let green_e3c2 = #colorLiteral(red: 0.3137254902, green: 0.8901960784, blue: 0.7607843137, alpha: 1) //50E3C2
    static let gray_200 = #colorLiteral(red: 0.7960784314, green: 0.8235294118, blue: 0.8509803922, alpha: 1) //CBD2D9
    static let gray_bdbd = #colorLiteral(red: 0.7960784314, green: 0.8235294118, blue: 0.8509803922, alpha: 1) //BDBDBD
    static let gray_400 = #colorLiteral(red: 0.5843137255, green: 0.5843137255, blue: 0.5843137255, alpha: 1) //959595
    static let gray_c4c4 = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1) //C4C4C4
    static let gray_600 = #colorLiteral(red: 0.7960784314, green: 0.7960784314, blue: 0.7960784314, alpha: 1) //CBCBCB
    static let gray_800 = #colorLiteral(red: 0.1215686275, green: 0.1215686275, blue: 0.1215686275, alpha: 1) //1F1F1F
    static let black_272C = #colorLiteral(red: 0.1411764706, green: 0.1529411765, blue: 0.1725490196, alpha: 1) //24272C
    static let blue_primary_900 = #colorLiteral(red: 0.01176470588, green: 0.3254901961, blue: 0.5333333333, alpha: 1) //035388
    static let blue_53b7 = #colorLiteral(red: 0.1137254902, green: 0.3254901961, blue: 0.7176470588, alpha: 1) //1D53B7
    static let blue_primary_700 = #colorLiteral(red: 0.1176470588, green: 0.3294117647, blue: 0.7176470588, alpha: 1) //1E54B7
    static let blue_primary_600 = #colorLiteral(red: 0.01960784314, green: 0.3215686275, blue: 0.7098039216, alpha: 1) //0552B5
    static let blue_primary_500 = #colorLiteral(red: 0.2, green: 0.4588235294, blue: 0.9058823529, alpha: 1) //3375E7
    static let blue_primary_400 = #colorLiteral(red: 0.3607843137, green: 0.568627451, blue: 0.9254901961, alpha: 1) //5C91EC
    static let blue_primary_200 = #colorLiteral(red: 0.5058823529, green: 0.8705882353, blue: 0.9921568627, alpha: 1) //81DEFD
    static let blue_primary_50 = #colorLiteral(red: 0.8901960784, green: 0.9725490196, blue: 1, alpha: 1) //E3F8FF
    static let blue_primary_100 = #colorLiteral(red: 0.9215686275, green: 0.9450980392, blue: 0.9882352941, alpha: 1) //EBF1FC
    static let blue_primary_300 = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1) //2F80ED
    static let red_500 = #colorLiteral(red: 0.8823529412, green: 0.1764705882, blue: 0.2235294118, alpha: 1) //E12D39
    static let red_600 = #colorLiteral(red: 0.8117647059, green: 0.06666666667, blue: 0.1411764706, alpha: 1) //CF1124
    static let red_300 = #colorLiteral(red: 0.8117647059, green: 0.06666666667, blue: 0.1411764706, alpha: 1) //FF0505
    static let red_5757 = #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 1) //EB5757
    static let red_0000 = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1) //FF0000
    static let green_500 = #colorLiteral(red: 0.1294117647, green: 0.6431372549, blue: 0.3254901961, alpha: 1) //21A453
    static let green_700 = #colorLiteral(red: 0.07843137255, green: 0.4901960784, blue: 0.3921568627, alpha: 1) //147D64
    static let green_800 = #colorLiteral(red: 0, green: 0.4235294118, blue: 0.3568627451, alpha: 1) //006C5B
    static let green_d566 = #colorLiteral(red: 0.1843137255, green: 0.8352941176, blue: 0.4, alpha: 1) //2FD566
    static let green_af60 = #colorLiteral(red: 0.2980392157, green: 0.6862745098, blue: 0.3137254902, alpha: 1) //4CAF50
    static let orange_a623 = #colorLiteral(red: 0.9607843137, green: 0.6509803922, blue: 0.137254902, alpha: 1) //F5A623
    static let orange_af45 = #colorLiteral(red: 0.9529411765, green: 0.6862745098, blue: 0.2705882353, alpha: 1) //F3AF45
    static let orange_ae4f = #colorLiteral(red: 0.9450980392, green: 0.6823529412, blue: 0.3098039216, alpha: 1) //F1AE4F
    static let orange_700 = #colorLiteral(red: 0.7960784314, green: 0.431372549, blue: 0.09019607843, alpha: 1) //CB6E17
    static let yellow_d401 = #colorLiteral(red: 1, green: 0.831372549, blue: 0.003921568627, alpha: 1) //FFD401
    static let neutrals_050 = #colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9803921569, alpha: 1) //F5F7FA
}
