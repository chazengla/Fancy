//
//  CustomLabels.swift
//  FancyCopy
//
//  Created by Arnie Englander on 24/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import Foundation
import UIKit

class ErrorMessageLabel: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        super.init(frame: .zero)
        let att = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont(name: Constants.futuraPrimary, size: 13)!, NSAttributedString.Key.foregroundColor : Document.errorRed])
        attributedText = att
        textAlignment = .center
        isHidden = true
        
    }
    
    
}

