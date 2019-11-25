//
//  HomeViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 09/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class HomeViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    } 
    let logoImage: UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "Icon"))
        img.contentMode = .scaleAspectFit
        img.withSize(.init(width: 24, height: 46))
        return img
    }()
    
    let fancyLabel: UILabel = {
        let label = UILabel()
        label.text = "Fancy"
        label.font = UIFont(name: Constants.futuraPrimary, size: 35)
        label.textColor = Document.hotPink
        
        return label
    }()
    
    lazy var logoLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImage, fancyLabel])
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "searchIcon").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Document.grey
        imageView.withSize(.init(width: 18, height: 18))
        return imageView
    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        let attTextForPlaceholder = NSAttributedString(string: "Search for Drinks, Sweets or more", attributes: [NSAttributedString.Key.font :  UIFont(name: Constants.futuraPrimary , size: 15)!])
        textField.attributedPlaceholder = attTextForPlaceholder
        let attTextForText = NSAttributedString(string: "", attributes: [NSAttributedString.Key.font :  UIFont(name: Constants.futuraPrimary , size: 15)!])
        textField.attributedText = attTextForText

        return textField
        
    }()
    
    lazy var searchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchIcon, searchTextField])
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    
    let addressContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Document.grey.withAlphaComponent(0.2)
        view.withHeight(50)
        return view
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivering to EC1V 9NQ"
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        label.textColor = Document.black
        
        return label
    }()
    
    let changeLabel: UILabel = {
        let label = UILabel()
        label.text = "Change"
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        label.textColor = Document.hotPink
        
        return label
    }()
    
    let containerView = UIView(backgroundColor: .red)
    
    
    let child = CardViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        setupViews()        
        
        }
    
    
        
    func setupViews(){
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        view.addSubview(logoLabelStackView)
        view.addSubview(searchStackView)
        view.addSubview(addressContainerView)
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        addressContainerView.addSubview(addressLabel)
        addressContainerView.addSubview(changeLabel)
        
        logoLabelStackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 30, bottom: 0, right: 0))
        
        searchStackView.anchor(top: logoLabelStackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 30, bottom: 0, right: 0))
        
        addressContainerView.anchor(top: searchStackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        addressLabel.centerYToSuperview()
        addressLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 30, bottom: 0, right: 0))
        
        changeLabel.centerYToSuperview()
        changeLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 30))
        
        child.view.anchor(top: changeLabel.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        
        

    }
    


    

}

class ItemCell: LBTAListCell<Item> {
    
    let itemLabel = UILabel(text: "Drinks", font: UIFont(name: Constants.futuraPrimary, size: 25), textColor: .white)
    
    override var item: Item! {
        didSet {
            itemLabel.text = item.text
            backgroundColor = item.bgColor
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(itemLabel)
        itemLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 10, right: 0))
    }
}

struct Item {
    let bgColor: UIColor
    let text: String
}



class CardViewController: LBTAListController<ItemCell, Item>, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        
        items = [
            .init(bgColor: UIColor(netHex: 0x749bff), text: "Drinks"),
            .init(bgColor: UIColor(netHex: 0x1ef0a6), text: "Sweets"),
            .init(bgColor: UIColor(netHex: 0xED41AD), text: "Ice Cream"),
            .init(bgColor: UIColor(netHex: 0xFF9E37), text: "Booze"),
            .init(bgColor: UIColor(netHex: 0x41D5ED), text: "Snacks"),
            .init(bgColor: UIColor(netHex: 0xFF536E), text: "Essentials"),
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width-40)/2.1
        return .init(width: width, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 30, left: 20, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        goTo(vc: ItemsViewController())
    }
    
    
    

    

    
    
}


import SwiftUI
struct MainPreview4: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView4().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView4: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview4.ContainerView4>) -> UIViewController {
            return HomeViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview4.ContainerView4.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview4.ContainerView4>) {
            
        }
    }

}
