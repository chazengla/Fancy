//
//  EnterPhoneViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 09/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class ConfirmPageViewController: UIViewController {

    let enterCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the code we sent you to"
        label.font = UIFont(name: Constants.futuraPrimary, size: 20)
        label.textColor = Document.black
        
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "+44 7955789831"
        label.font = UIFont(name: Constants.futuraPrimary, size: 20)
        label.textColor = Document.black
        
        return label
    }()

    
    let enterCodeTextField = CustomTextField(placeholder: "Enter the code here", bolded: false)
    
    let confirmButton: CustomButton = {
        let button = CustomButton(title: "Next")
        return button
    }()
    
    let resendCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Resend Code"
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        label.textColor = Document.hotPink
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupNav()
        setupTargets()
    }
    
    func setupViews(){
        view.backgroundColor = .white
        
        view.addSubviews(enterCodeLabel, phoneNumberLabel, enterCodeTextField, confirmButton, resendCodeLabel)
        
        enterCodeTextField.centerYToSuperview()
        enterCodeTextField.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 55, bottom: 0, right: 55))
        
        phoneNumberLabel.centerXToSuperview()
        phoneNumberLabel.anchor(top: nil, leading: nil, bottom: enterCodeTextField.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 85, right: 0))
        
        enterCodeLabel.centerXToSuperview()
        enterCodeLabel.anchor(top: nil, leading: nil, bottom: phoneNumberLabel.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 20, right: 0))
        
        confirmButton.centerXToSuperview()
        confirmButton.anchor(top: enterCodeTextField.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 60, left: 0, bottom: 0, right: 0))
        
        resendCodeLabel.centerXToSuperview()
        resendCodeLabel.anchor(top: confirmButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
    }
    
    
    func setupNav(){
    
        self.title = "Confirm Phone"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))
    }

    
    func setupTargets(){
        confirmButton.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
    }
    
    @objc func moveToNext(){
        navigationController?.pushViewController(AppTabViewController(), animated: true)
    }
   

}


import SwiftUI
struct MainPreview2: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView2().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView2: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview2.ContainerView2>) -> UIViewController {
            return ConfirmPageViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview2.ContainerView2.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview2.ContainerView2>) {
            
        }
    }

}
