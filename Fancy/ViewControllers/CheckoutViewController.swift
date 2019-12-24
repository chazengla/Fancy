//
//  CheckoutViewController.swift
//  FancyCopy
//
//  Created by Arnie Englander on 22/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    let deliverToLabel = UILabel(text: "Deliver to", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: .black)
    
    let changeAddressButton : UIButton = {
        let btn = UIButton()
        let att = NSAttributedString(string: "Change", attributes: [NSAttributedString.Key.font : UIFont(name: Constants.futuraPrimary, size: 20)!, NSAttributedString.Key.foregroundColor : Colors.hotPink])
        btn.setAttributedTitle(att, for: .normal)
        return btn
    }()
    
    let map = MapViewController()
    
    let addressContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "3 Bath St, Flat 13, EC1V 9LB"
        label.textColor = Colors.grey
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let seperator = Seperator()
    
    let paymentLabel = UILabel(text: "Payment", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: .black)
    
    let changePaymentButton : UIButton = {
        let btn = UIButton()
        let att = NSAttributedString(string: "Change", attributes: [NSAttributedString.Key.font : UIFont(name: Constants.futuraPrimary, size: 20)!, NSAttributedString.Key.foregroundColor : Colors.hotPink])
        btn.setAttributedTitle(att, for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubviews(deliverToLabel, changeAddressButton, map.view, addressContainerView, addressLabel, seperator, paymentLabel, changePaymentButton)
        
        addChild(map)
        
        deliverToLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 30, bottom: 0, right: 0))
        changeAddressButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 30))
        map.view.anchor(top: deliverToLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        map.view.withHeight(250)
        addressContainerView.anchor(top: map.view.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        addressContainerView.withHeight(50)
        seperator.anchor(top: nil, leading: view.leadingAnchor, bottom: addressContainerView.bottomAnchor, trailing: view.trailingAnchor)
        addressContainerView.addSubview(addressLabel)
        addressLabel.fillSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        paymentLabel.anchor(top: addressContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 30, bottom: 0, right: 0))
        changePaymentButton.anchor(top: addressContainerView.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 30))
    }
    


}


import SwiftUI
struct MainPreview18: PreviewProvider {
    static var previews: some View {

        ContainerView18().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView18: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview18.ContainerView18>) -> UIViewController {
            return CheckoutViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview18.ContainerView18.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview18.ContainerView18>) {
            
        }
        
    }
        
}
