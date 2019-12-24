//
//  CustomViews.swift
//  Fancy
//
//  Created by Arnie Englander on 01/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

class Seperator: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = Colors.lightGrey
        withHeight(2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class EditQuantityButton: UIView{
    
    let addButton = CustomAddButton(title: "1")
    let minusButton: UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "negative-sign")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    let plusButton: UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "plus-sign")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero)
        setupViews()
        
    }
    
    func setupViews(){
        addSubviews(addButton, minusButton, plusButton)
        addButton.fillSuperview()
        
        
        withHeight(40)
        addButton.withHeight(100)
        withWidth(140)
        minusButton.centerYToSuperview()
        plusButton.centerYToSuperview()
        
        minusButton.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 15, bottom: 0, right: 0), size: .init(width: 17, height: 17))
        plusButton.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 15), size: .init(width: 17, height: 17))
    }
    
    
        
}
