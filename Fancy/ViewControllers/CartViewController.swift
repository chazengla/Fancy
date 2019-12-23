//
//  CartViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 01/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class CartViewController: UIViewController {

    let headerLabel = UILabel(text: "Your order", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: .black)
    
    let subtotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Subtotal"
        label.textColor = Document.grey
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let subtotalValueLabel: UILabel = {
        let label = UILabel()
        label.text = "£2.57"
        label.textColor = Document.grey
        label.textAlignment = .right
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let deliveryFeeLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery fee"
        label.textColor = Document.grey
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let deliveryFeeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "£3.57"
        label.textColor = Document.grey
        label.textAlignment = .right
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let serviceFeeLabel: UILabel = {
        let label = UILabel()
        label.text = "Service fee"
        label.textColor = Document.grey
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let serviceFeeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "£0.57"
        label.textColor = Document.grey
        label.textAlignment = .right
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let orderTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Order Total"
        label.textColor = .black
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let orderTotalValueLabel: UILabel = {
        let label = UILabel()
        label.text = "£12.57"
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: Constants.futuraBold, size: 15)
        return label
    }()
    
    lazy var subTotalStack = UIStackView(arrangedSubviews: [subtotalLabel, subtotalValueLabel])
    lazy var deliveryFeeStack = UIStackView(arrangedSubviews: [deliveryFeeLabel, deliveryFeeValueLabel])
    lazy var serviceFeeStack = UIStackView(arrangedSubviews: [serviceFeeLabel, serviceFeeValueLabel])
    lazy var orderTotalStack = UIStackView(arrangedSubviews: [orderTotalLabel, orderTotalValueLabel])
    lazy var vStack = UIStackView(arrangedSubviews: [subTotalStack, deliveryFeeStack, serviceFeeStack])
    
    let bottomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Document.grey.withAlphaComponent(0.25)
        return view
    }()
    
    let addVoucherCodeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let addVoucherCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Add voucher code"
        label.textColor = Document.hotPink
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let seperator = Seperator()
    
    let headerLabel2 = UILabel(text: "You might also like", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: .black)

    let child = SingleOrderListViewController()
    let child2 = HorizontalItemCollectionViewController(scrollDirection: .horizontal)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setupViews(){
        
        addChild(child)
        addChild(child2)
        view.backgroundColor = .white
        view.addSubviews(headerLabel, child.view, vStack, orderTotalStack, bottomContainerView, addVoucherCodeView, headerLabel2, child2.view, seperator)
        
        
        headerLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        child.view.anchor(top: headerLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        child.view.withHeight(250)
        
        
        setupStacks()
    
        
        vStack.anchor(top: child.view.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        bottomContainerView.anchor(top: vStack.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 35, left: 0, bottom: 0, right: 0))
        bottomContainerView.withHeight(110)
        
        addVoucherCodeView.anchor(top: bottomContainerView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 35, left: 0, bottom: 0, right: 0))
        addVoucherCodeView.withHeight(75)
        
        addVoucherCodeView.addSubviews(addVoucherCodeLabel)
        addVoucherCodeLabel.centerYToSuperview()
        addVoucherCodeLabel.anchor(top: nil, leading: superview(view: addVoucherCodeLabel)?.leadingAnchor, bottom: nil, trailing: superview(view: addVoucherCodeLabel)?.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        
        seperator.anchor(top: addVoucherCodeView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        headerLabel2.anchor(top: addVoucherCodeView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 20, bottom: 0, right: 0))
        
        child2.view.anchor(top: headerLabel2.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        child2.view.withHeight(200)

        
        
        
        
        
    }
    
    func setupStacks() {
        [subTotalStack, deliveryFeeStack, serviceFeeStack, orderTotalStack].forEach {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
        }
        vStack.axis = .vertical
        vStack.spacing = 10
    }
    

 

}

import SwiftUI
struct MainPreview15: PreviewProvider {
    static var previews: some View {

        ContainerView15().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView15: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview15.ContainerView15>) -> UIViewController {
            return CartViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview15.ContainerView15.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview15.ContainerView15>) {
            
        }
        
    }
        
}

extension UIViewController{
    
    func superview(view: UIView) -> UIView? {
        guard let superview = view.superview else { return nil }
        return superview
    }
}
