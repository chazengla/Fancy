//
//  EditItemQuantityViewController.swift
//  FancyCopy
//
//  Created by Arnie Englander on 24/12/2020.
//  Copyright © 2020 Arnie Englander. All rights reserved.
//

import UIKit

class EditItemQuantityViewController: UIViewController {

    let itemLabel = UILabel(text: "Sprite 1L", font: Fonts.futuraBold20, textColor: Colors.black, textAlignment: .center)
    
    let quanityView = EditQuantityButton()
    
    let priceLabel = UILabel(text: "£2.99", font: Fonts.futuraMedium15, textColor: Colors.grey, textAlignment: .center)
    
    let seperator = Seperator()
    
    let updateButton: UIButton = {
        let btn = UIButton()
        let att = NSAttributedString(string: "UPDATE", attributes: [NSAttributedString.Key.font : Fonts.futuraBold15!, NSAttributedString.Key.foregroundColor : Colors.hotPink])
        btn.setAttributedTitle(att, for: .normal)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

        
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubviews(itemLabel, quanityView, priceLabel, seperator, updateButton)
        [itemLabel, quanityView, priceLabel, updateButton].forEach {
            $0.centerXToSuperview()
        }
        
        itemLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0))
        
    
        quanityView.anchor(top: itemLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        quanityView.constrainWidth(140)
        
        priceLabel.anchor(top: quanityView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        seperator.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 100, right: 0))

        updateButton.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0))

    }
    
}


import SwiftUI
struct MainPreview20: PreviewProvider {
    static var previews: some View {

        ContainerView20().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView20: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview20.ContainerView20>) -> UIViewController {
            return EditItemQuantityViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview20.ContainerView20.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview20.ContainerView20>) {
            
        }
        
    }
        
}
