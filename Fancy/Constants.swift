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
    static let mintGreen = UIColor(netHex: 0x3AF6B3)
    static let black = UIColor(netHex: 0x000000)
    static let grey = UIColor(netHex: 0xC7C7C7)
}


struct Constants {
    static let futuraPrimary = "Futura-Medium"
    static let futuraBold = "Futura-Bold"
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
//
