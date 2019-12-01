//
//  CustonButton.swift
//  ChazProject
//
//  Created by Arnie Englander on 09/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

class CustomButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String){
        super.init(frame: .zero)
        
        let attText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font :  UIFont(name: Constants.futuraBold , size: 15)!, NSAttributedString.Key.foregroundColor : UIColor.white])
        self.setAttributedTitle(attText, for: .normal)
        self.backgroundColor = Document.hotPink
        self.layer.cornerRadius = 15
        self.withSize(.init(width: 270, height: 50))
    }
    
    
        
}


class CustomAddButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String){
        super.init(frame: .zero)
        
        let attText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font :  UIFont(name: Constants.futuraBold , size: 15)!, NSAttributedString.Key.foregroundColor : UIColor.white])
        self.setAttributedTitle(attText, for: .normal)
        self.backgroundColor = Document.hotPink
        self.layer.cornerRadius = 15
        self.withHeight(40)
    }
    
    
        
}
