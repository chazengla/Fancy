//
//  CategoryViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 11/11/20110.
//  Copyright © 20110 Arnie Englander. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
}

import SwiftUI
struct MainPreview10: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView10().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView10: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview10.ContainerView10>) -> UIViewController {
            return CategoryViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview10.ContainerView10.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview10.ContainerView10>) {
            
        }
        
    }

}
