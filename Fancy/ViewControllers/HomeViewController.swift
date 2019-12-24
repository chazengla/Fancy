//
//  HomeViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 09/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class HomeViewController: UIViewController, UITextFieldDelegate {

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
    
    let errorMessage = ErrorMessageLabel(text: "Sorry, we do not deliver to this address.")
    
    let changeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Change", for: .normal)
        let att = NSAttributedString(string: "Change", attributes: [NSAttributedString.Key.font : UIFont(name: Constants.futuraPrimary, size: 15)!, NSAttributedString.Key.foregroundColor : Document.hotPink])
        btn.setAttributedTitle(att, for: .normal)
        return btn
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
        setupTargets()
        
        
    }
    
    func setupTargets(){
        changeButton.addTarget(self, action: #selector(changeButtonPressed), for: .touchUpInside)
    }
    
    @objc func changeButtonPressed(){
        goTo(vc: AddressViewController())
    }
    
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//        let paraStyle: NSParagraphStyle = NSParagraphStyle()
//        textField.typingAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black,
//                                      NSAttributedString.Key.paragraphStyle : paraStyle, NSAttributedString.Key.font : UIFont.init(name: Constants.futuraPrimary , size: 15)!]
//    }
    
    
        
    func setupViews(){
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
       
        addChild(child)
        view.addSubviews(logoLabelStackView, addressContainerView, child.view, errorMessage)
        
        addressContainerView.addSubviews(addressLabel, changeButton)
        
        
        logoLabelStackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 30, bottom: 0, right: 0))
        
        
        addressContainerView.anchor(top: logoLabelStackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 60, left: 0, bottom: 0, right: 0))
        
        addressLabel.centerYToSuperview()
        addressLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 30, bottom: 0, right: 0))
        
        errorMessage.anchor(top: addressContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        changeButton.centerYToSuperview()
        changeButton.anchor(top: nil, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 30))
        
        child.view.anchor(top: changeButton.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 10))
        
        
        

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
        
        let cell = collectionView.cellForItem(at: indexPath) as! ItemCell
        let searchVc = SearchResultsViewController()
        print(cell.itemLabel.text)
        searchVc.headerTitle = cell.itemLabel.text!
        
        goTo(vc: searchVc)
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
