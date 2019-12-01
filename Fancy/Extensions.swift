//
//  Extensions.swift
//  Fancy
//
//  Created by Arnie Englander on 01/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

extension UIView{
    
    func addSubviews(_ views: UIView...){
        views.forEach { addSubview($0)
        }
    }
}
