//
//  ViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 09/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class LandingPageViewController: UIViewController {

    let logoImage: UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "Icon"))
        img.contentMode = .scaleAspectFit
        img.withSize(.init(width: 24, height: 46))
        return img
    }()
    
    let fancyLabel: UILabel = {
        let label = UILabel()
        label.text = "Fancy"
        label.font = Fonts.titleFont
        label.textColor = Document.hotPink
        
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Get snacks delivered in 30 minutes or less"
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        label.textColor = Document.black
        
        return label
    }()
    
    let seperatorView = Seperator()

    
    let phoneNumberButton: CustomButton = {
        let button = CustomButton(title: "Continue with phone number")
        return button
    }()
    
    
    let tandcLabel: UILabel = {
        let label = UILabel()
        label.text = "Terms of Service & Privacy Policy"
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        label.textColor = Document.grey
        return label
    }()
    
    let dothislaterLabel: UILabel = {
        let label = UILabel()
        label.text = "Do this later "
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        label.textColor = Document.hotPink
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        setupViews()
        setupTargets()
    }
    
    func setupViews(){
        
        view.backgroundColor = .white
        view.addSubviews(logoImage, fancyLabel, infoLabel, seperatorView, phoneNumberButton, tandcLabel, dothislaterLabel)
        
        
        logoImage.centerYToSuperview()
        fancyLabel.centerYToSuperview()
        phoneNumberButton.centerXToSuperview()
        
        logoImage.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 70, bottom: 0, right: 0))
        fancyLabel.anchor(top: nil, leading: logoImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 15, bottom: 0, right: 0))
        infoLabel.anchor(top: logoImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 25, left: 70, bottom: 0, right: 0))
        seperatorView.anchor(top: infoLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 0))
        
        
        phoneNumberButton.anchor(top: infoLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 90, left: 0, bottom: 0, right: 0))
        tandcLabel.centerXToSuperview()
        tandcLabel.anchor(top: phoneNumberButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 25, left: 0, bottom: 0, right: 0))
        dothislaterLabel.centerXToSuperview()
        dothislaterLabel.anchor(top: tandcLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 25, left: 0, bottom: 0, right: 0))

    }
    
    func setupTargets(){
        phoneNumberButton.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
        
    }
    
    @objc func moveToNext(){
        goTo(vc: EnterPhoneViewController())
    }


}


import SwiftUI
struct MainPreview: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return LandingPageViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }

}

