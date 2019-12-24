//
//  OrdersViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 10/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools


class OrdersViewController: LBTAListController<OrdersItemCell, OrderItem>, UICollectionViewDelegateFlowLayout{
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.isHidden = false
        title = "Orders"
        

        items = [
            .init(orderNumber: "#23409", price: "£22.50", date: "15th November"),
            .init(orderNumber: "#23411", price: "£7.50", date: "12th August")
        ]
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        return .init(width: width, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 60, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goTo(vc: OrderSummaryViewController())
    }
    
    
    
    func setupNav(){
        navigationController?.navigationBar.isHidden = false
        self.title = "Orders"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))

    }
        
        
}

class OrdersItemCell: LBTAListCell<OrderItem> {
    
    let orderNumberLabel = UILabel(text: "#23409", font: UIFont(name: Constants.futuraPrimary, size: 15), textColor: Colors.black)
    let priceLabel = UILabel(text: "£23.90", font: UIFont(name: Constants.futuraPrimary, size: 15), textColor: Colors.grey)
    let dateLabel = UILabel(text: "12 November 2019", font: UIFont(name: Constants.futuraPrimary, size: 15), textColor: Colors.grey)
    
    
    lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grey.withAlphaComponent(0.2)
        view.withHeight(1)
        return view
    }()
    
    let arrowImage: UIImageView = {
        let arrow = UIImageView()
        arrow.image = #imageLiteral(resourceName: "rightArrow").withRenderingMode(.alwaysTemplate)
        arrow.tintColor = Colors.grey
        arrow.withSize(.init(width: 20, height: 20))
        return arrow
    }()
    
    override var item: OrderItem! {
        didSet {
            orderNumberLabel.text = item.orderNumber
            priceLabel.text = item.price
            dateLabel.text = item.date
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
//        backgroundColor = .blue
        
        stack(orderNumberLabel, priceLabel, dateLabel, spacing: 5).withMargins(.init(top: 0, left: 30, bottom: 10, right: 0))
        addSubview(seperatorView)
        addSubview(arrowImage)
        
    
        seperatorView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        arrowImage.centerYToSuperview()
        arrowImage.anchor(top: nil, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 30))
    }
}

struct OrderItem {
    let orderNumber, price, date: String
}





import SwiftUI
struct MainPreview7: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView7().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView7: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview7.ContainerView7>) -> UIViewController {
            return OrdersViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview7.ContainerView7.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview7.ContainerView7>) {
            
        }
        
    }

}
