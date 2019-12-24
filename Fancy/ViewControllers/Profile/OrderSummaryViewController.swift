//
//  SingleOrderViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 10/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools


class OrderSummaryViewController: UIViewController {

    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Your order #67976"
        label.textColor = .black
        label.font = UIFont(name: Constants.futuraBold, size: 20)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivered 11 November 2019"
        label.textColor = .black
        label.font = UIFont(name: Constants.futuraBold, size: 20)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivered to 3 Bath St, Flat 13, London, EC1V 9LB"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: Constants.futuraBold, size: 20)
        
        return label
    }()
    
    let subtotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Subtotal"
        label.textColor = Colors.grey
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let subtotalValueLabel: UILabel = {
        let label = UILabel()
        label.text = "£2.57"
        label.textColor = Colors.grey
        label.textAlignment = .right
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let deliveryFeeLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery fee"
        label.textColor = Colors.grey
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let deliveryFeeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "£3.57"
        label.textColor = Colors.grey
        label.textAlignment = .right
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let serviceFeeLabel: UILabel = {
        let label = UILabel()
        label.text = "Service fee"
        label.textColor = Colors.grey
        label.font = UIFont(name: Constants.futuraPrimary, size: 15)
        return label
    }()
    
    let serviceFeeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "£0.57"
        label.textColor = Colors.grey
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
    
    let child = SingleOrderListViewController()
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        // Do any additional setup after loading the view.
    }
    
    func setupViews(){
        
        view.backgroundColor = .white
        view.addSubview(orderLabel)
        view.addSubview(dateLabel)
        view.addSubview(addressLabel)
        addChild(child)
        view.addSubview(child.view)
        
        orderLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: 20))
        dateLabel.anchor(top: orderLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        addressLabel.anchor(top: dateLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        child.view.anchor(top: addressLabel.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 250, right: 0))
        
        
        let subTotalStack = UIStackView(arrangedSubviews: [subtotalLabel, subtotalValueLabel])
        let deliveryFeeStack = UIStackView(arrangedSubviews: [deliveryFeeLabel, deliveryFeeValueLabel])
        let serviceFeeStack = UIStackView(arrangedSubviews: [serviceFeeLabel, serviceFeeValueLabel])
        let orderTotalStack = UIStackView(arrangedSubviews: [orderTotalLabel, orderTotalValueLabel])
        
        [subTotalStack, deliveryFeeStack, serviceFeeStack, orderTotalStack].forEach {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
        }
        
        let vStack = UIStackView(arrangedSubviews: [subTotalStack, deliveryFeeStack, serviceFeeStack])
        vStack.axis = .vertical
        vStack.spacing = 10
        
        view.addSubview(vStack)
        view.addSubview(orderTotalStack)
        vStack.anchor(top: child.view.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        orderTotalStack.anchor(top: vStack.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        

    }
    
    func setupNav(){
        navigationController?.navigationBar.isHidden = false
        self.title = "Order"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))

    }
    


}


class SingleOrderListViewController: LBTAListController<OrderCell, _Item>, UICollectionViewDelegateFlowLayout{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Order"
        

        items = [
            .init(name: "Sprite 1L", price: "£1.95"),
            .init(name: "CoSpriteke 1L", price: "£1.95"),
            .init(name: "Pepsi 1L", price: "£12.95"),
        ]
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        return .init(width: width, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    
        
        
}


class OrderCell: LBTAListCell<_Item> {
    
    
    let quantityLabel = UILabel(text: "1x", font: UIFont(name: Constants.futuraPrimary, size: 15), textColor: Colors.grey)
    let nameLabel = UILabel(text: "Sprite 1L", font: UIFont(name: Constants.futuraPrimary, size: 15), textColor: Colors.black)
    let priceLabel = UILabel(text: "£0.59", font: UIFont(name: Constants.futuraPrimary, size: 15), textColor: Colors.black, textAlignment: .right)
    
    
    override var item: _Item! {
        didSet {
            quantityLabel.text = "1x"
            nameLabel.text = item.name
            priceLabel.text = item.price
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        
    
        


        hstack(quantityLabel, nameLabel, priceLabel,  spacing: 10, distribution: .fillProportionally).padLeft(20).padRight(20)
        
        
    }
}


struct _Item{
    let name: String
    let price: String
}


import SwiftUI
struct MainPreview9: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView9().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView9: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview9.ContainerView9>) -> UIViewController {
            return OrderSummaryViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview9.ContainerView9.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview9.ContainerView9>) {
            
        }
        
    }

}
