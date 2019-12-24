//
//  IndividualItemViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 30/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class ProductPageViewController: UIViewController {

    var added: Bool = false
    
    let itemImageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = Colors.grey
        img.image = UIImage(named: "crisp")
        img.contentMode = .scaleAspectFill
    
        return img
    
    }()
    
    let imageContainer: UIView = {
        let container = UIView()
        container.backgroundColor = Colors.white
        return container
    }()
    
    let itemContainer: UIView = {
        let container = UIView()
        container.backgroundColor = Colors.white
        return container
    }()
    
    let seperator = Seperator()
    let seperator1 = Seperator()

    
    let itemNameLabel: UILabel = {
        let name = UILabel()
        name.text = "Bacon Rashers Crips"
        name.font = UIFont(name: Constants.futuraBold, size: 20)
        name.textColor = Colors.hotPink
        return name
    }()
    
    let itemPriceLabel: UILabel = {
        let price = UILabel()
        price.text = "£1.99"
        price.font = UIFont(name: Constants.futuraPrimary, size: 20)
        price.textColor = Colors.black
        return price
    }()
    
    let addToCartButton = CustomAddButton(title: "Add to cart")
    
    let addedToCartButton = EditQuantityButton()
    
    
    let headerLabel = UILabel(text: "You might also like", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: .black)
    
    
    let child = HorizontalItemCollectionViewController(scrollDirection: .horizontal)

    
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        setupTargets()
        
    }
    
    func setupTargets(){
        addToCartButton.addTarget(self, action: #selector(addToCartButtonPressed), for: .touchUpInside)
    }
    
    @objc func addToCartButtonPressed(){
        print("added")

    }
    
    func setupNav(){
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))
        
    }
    
    func setupViews(){
        
        view.backgroundColor = .white
        
        view.addSubviews(imageContainer, itemContainer, seperator, seperator1, child.view, headerLabel)
        
        imageContainer.addSubview(itemImageView)
        
        
        
        imageContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: view.frame.height/2, right: 0))
        
        itemImageView.fillSuperview(padding: .init(top: 50, left: 50, bottom: 50, right: 50))
        


        
        itemContainer.anchor(top: imageContainer.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        itemContainer.withHeight(100)
    itemContainer.addSubviews(itemNameLabel,itemPriceLabel,addToCartButton)
        
        itemNameLabel.anchor(top: itemContainer.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 25, bottom: 0, right: 0))
        itemNameLabel.withWidth(view.frame.width*0.55)
        itemPriceLabel.anchor(top: itemNameLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 25, bottom: 0, right: 0))
        
        
        addToCartButton.anchor(top: itemContainer.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 25))
        addToCartButton.withWidth(120)
        
        seperator.anchor(top: imageContainer.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        seperator1.anchor(top: itemContainer.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        
        
        
        headerLabel.anchor(top: itemContainer.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 20, bottom: 0, right: 0))
        
        child.view.anchor(top: headerLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        child.view.withHeight(200)

    }
    

    
}




import SwiftUI
struct MainPreview14: PreviewProvider {
    static var previews: some View {

        ContainerView14().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView14: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview14.ContainerView14>) -> UIViewController {
            return ProductPageViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview14.ContainerView14.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview14.ContainerView14>) {
            
        }
        
    }
        
}
