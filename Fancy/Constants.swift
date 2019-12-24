//
//  Fonts&Colors.swift
//  Fancy
//
//  Created by Arnie Englander on 25/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

struct Document {
    static let hotPink = UIColor(netHex: 0xF49BEF)
    static let mintGreen = UIColor(netHex: 0x20F1A7)
    static let black = UIColor(netHex: 0x000000)
    static let grey = UIColor(netHex: 0xC7C7C7)
    static let lightGrey = UIColor(netHex: 0xF8F8F8)
    static let errorRed = UIColor(netHex: 0xDF6E6E)
    static let white = UIColor(netHex: 0xffffff)
}


struct Constants {
    static let futuraPrimary = "Futura-Medium"
    static let futuraBold = "Futura-Bold"
}

struct Fonts{
    static let titleFont = UIFont(name: "Futura-Medium", size: 25)
    static let futuraBold20 = UIFont(name: "Futura-Bold", size: 20)
    static let futuraMedium20 = UIFont(name: "Futura-Medium", size: 20)
    static let futuraBold15 = UIFont(name: "Futura-Bold", size: 15)
    static let futuraMedium15 = UIFont(name: "Futura-Medium", size: 15)
    static let futuraBold13 = UIFont(name: "Futura-Bold", size: 13)
    static let futuraMedium13 = UIFont(name: "Futura-Medium", size: 13)
    static let futuraBold12 = UIFont(name: "Futura-Bold", size: 12)
    static let futuraMedium12 = UIFont(name: "Futura-Medium", size: 12)

}




extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
