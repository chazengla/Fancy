//
//  EnterPhoneViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 09/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class EnterPhoneViewController: UIViewController {

    let intructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your mobile phone number"
        label.font = UIFont(name: Constants.futuraPrimary, size: 20)
        label.textColor = Document.black
        
        return label
    }()

    
    let phoneNumberTextField = CustomTextField(placeholder: "+44 7955789831", bolded: true)
    
    let nextButton: CustomButton = {
        let button = CustomButton(title: "Next")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupNav()
        setupTargets()
    }
    
    func setupViews(){
        

        view.backgroundColor = .white
        view.addSubview(intructionsLabel)
        view.addSubview(phoneNumberTextField)
        view.addSubview(nextButton)
        phoneNumberTextField.centerYToSuperview()
        phoneNumberTextField.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 55, bottom: 0, right: 55))
        intructionsLabel.centerXToSuperview()
        intructionsLabel.anchor(top: nil, leading: nil, bottom: phoneNumberTextField.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 70, right: 0))
        nextButton.centerXToSuperview()
        nextButton.anchor(top: phoneNumberTextField.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 60, left: 0, bottom: 0, right: 0))
    }

    func setupNav(){
        navigationController?.navigationBar.isHidden = false
        self.title = "Let's go"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))

    }
    
    func setupTargets(){
        nextButton.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)

    }
    
    @objc func moveToNext(){
        navigationController?.pushViewController(ConfirmPageViewController(), animated: true)
    }
   

}


import SwiftUI
struct MainPreview1: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView1().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView1: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview1.ContainerView1>) -> UIViewController {
            return EnterPhoneViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview1.ContainerView1.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview1.ContainerView1>) {
            
        }
    }
}

extension UIViewController{
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
        
    }
}
