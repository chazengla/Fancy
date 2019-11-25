//
//  CustonButton.swift
//  ChazProject
//
//  Created by Arnie Englander on 09/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

class CustomTextField: UIView{
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = Document.grey.withAlphaComponent(0.2)
        view.withHeight(1)
        return view
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        
        return tf
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String, bolded: Bool){
        super.init(frame: .zero)
        
        setupUI(placeholder, bolded)
        setupContraints()
        
        
    }
    
    func setupUI(_ placeholder: String, _ bolded: Bool){
        
        if bolded == true{
            let attText = NSMutableAttributedString(string: String(placeholder.prefix(3)), attributes: [NSAttributedString.Key.font :  UIFont(name: Constants.futuraPrimary , size: 20)!, NSAttributedString.Key.foregroundColor : Document.black])
            let attText2 = NSMutableAttributedString(string: String(placeholder.suffix(11)), attributes: [NSAttributedString.Key.font :  UIFont(name: Constants.futuraPrimary , size: 20)!])
            attText.append(attText2)
            textField.attributedPlaceholder = attText
        }
        
        else{
            let attText = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.font :  UIFont(name: Constants.futuraPrimary , size: 20)!])
            textField.attributedPlaceholder = attText
        }
    }
    func setupContraints(){
        self.addSubview(bottomLine)
        self.addSubview(textField)
        textField.centerXToSuperview()
        bottomLine.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
        textField.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        
        
    }
    
    
}
