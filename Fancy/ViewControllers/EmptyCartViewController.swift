//
//  EmptyCartViewController.swift
//  FancyCopy
//
//  Created by Arnie Englander on 24/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

class EmptyCartViewController: UIViewController {

    let transparentView = UIView()
    let viewTest = UIView(backgroundColor: Document.white)
    
    let emptyCartLabel = UILabel(text: "Your cart is empty", font: Fonts.futuraBold20, textColor: Document.black, textAlignment: .center)
    
    let imageView = UIImageView(image: UIImage(named: "sad_face"))
    
    let browseButton = CustomButtonGreen(title: "BROWSE")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupTargets()
        // Do any additional setup after loading the view.
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubviews(emptyCartLabel, imageView, browseButton)
        
        emptyCartLabel.anchor(top: view.centerYAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -200, left: 0, bottom: 0, right: 0))
        
        imageView.centerXToSuperview()
        imageView.anchor(top: emptyCartLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0))
        imageView.withSize(.init(width: 100, height: 100))
    
        browseButton.anchor(top: imageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: 20))
    }
    
    func setupTargets(){
        browseButton.addTarget(self, action: #selector(filterPressed), for: .touchUpInside)
    }
    
    @objc func browseButtonPressed(){
        goTo(vc: AppTabViewController())
    }
    
    let height: CGFloat = 250
    
    @objc func filterPressed(){
        
        let window = UIApplication.shared.keyWindow
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        window?.addSubview(transparentView)

        let screenSize = UIScreen.main.bounds.size
        viewTest.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        window?.addSubview(viewTest)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)

        transparentView.alpha = 0

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.viewTest.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)

        
        
    }
    
    //filter button functionality
    @objc func onClickTransparentView() {
        print("running")
           let screenSize = UIScreen.main.bounds.size

           UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
               self.transparentView.alpha = 0
               self.viewTest.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
           }, completion: nil)
        
        
        
      
       }

}


import SwiftUI
struct MainPreview19: PreviewProvider {
    static var previews: some View {

        ContainerView19().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView19: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview19.ContainerView19>) -> UIViewController {
            return EmptyCartViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview19.ContainerView19.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview19.ContainerView19>) {
            
        }
        
    }
        
}
