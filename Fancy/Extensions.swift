//
//  Extensions.swift
//  Fancy
//
//  Created by Arnie Englander on 01/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

extension UIView{
    
    func addSubviews(_ views: UIView...){
        views.forEach { addSubview($0)
        }
    }
}

extension UIViewController{
    
    func goTo(vc: UIViewController){
        navigationController?.pushViewController(vc, animated: true)
    }
}


