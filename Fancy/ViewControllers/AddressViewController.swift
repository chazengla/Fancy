//
//  AddressViewController.swift
//  FancyCopy
//
//  Created by Arnie Englander on 22/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {

    let addressLine1 = CustomTextField(placeholder: "Address line 1", bolded: false)
    let addressLine2 = CustomTextField(placeholder: "Address line 2", bolded: false)
    let city = CustomTextField(placeholder: "City", bolded: false)
    let postcode = CustomTextField(placeholder: "Postcode", bolded: false)
    let country = CustomTextField(placeholder: "Country", bolded: false)
    let deliveryIntructions = CustomTextField(placeholder: "Helpful delivery instructions", bolded: false)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews(){
        [addressLine1, addressLine2, city, postcode, country, deliveryIntructions].forEach {
            $0.withWidth(view.frame.width*0.8)
        }
        view.backgroundColor = .white
        let sv = UIStackView(arrangedSubviews: [addressLine1, addressLine2, city, postcode, country, deliveryIntructions])
        view.addSubview(sv)
        sv.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: 20))
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.withHeight(500)
        sv.alignment = .center
        
        

    }
    


}

import SwiftUI
struct MainPreview16: PreviewProvider {
    static var previews: some View {

        ContainerView16().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView16: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview16.ContainerView16>) -> UIViewController {
            return AddressViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview16.ContainerView16.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview16.ContainerView16>) {
            
        }
        
    }
        
}
