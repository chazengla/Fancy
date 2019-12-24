//
//  ItemCVController.swift
//  Fancy
//
//  Created by Arnie Englander on 01/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools


class HorizontalItemCollectionViewController: LBTAListController<IndividualItemCell, IndividualItem>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.title = "Messages"
        
        items = [
            .init(text: "Drinks"),
            .init(text: "Sweets"),
            .init(text: "Ice Cream"),
            .init(text: "Booze"),
            .init(text: "Snacks"),
            .init(text: "Essentials"),
        ]
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: (view.frame.width-40)/3.1, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 30, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}



class IndividualItemCell: LBTAListCell<IndividualItem> {
    
    let itemLabel = UILabel(text: "£2.99", font: Fonts.futuraMedium12, textColor: .white, textAlignment: .center)
    let bottomView = UIView(backgroundColor: Colors.hotPink)
    
    
//    override var item: IndividualItem! {
//        didSet {
//            itemLabel.text = item.text
//        }
//    }
    
    override func setupViews() {
        super.setupViews()
        
        layer.borderColor = Colors.grey.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        clipsToBounds = true
        
        bottomView.layer.borderColor = Colors.hotPink.cgColor
        bottomView.layer.borderWidth = 1

        
        
        addSubview(bottomView)
        bottomView.addSubview(itemLabel)
        bottomView.constrainHeight(30)
        
        bottomView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        itemLabel.centerInSuperview()
    }
}

////Version 2 with add button
//class IndividualItemCell: LBTAListCell<IndividualItem> {
//
//    let itemLabel = UILabel(text: "ADD", font: UIFont(name: Constants.futuraBold, size: 15), textColor: .white, textAlignment: .center)
//    let bottomView = UIView(backgroundColor: Document.mintGreen)
//
//
////    override var item: IndividualItem! {
////        didSet {
////            itemLabel.text = item.text
////        }
////    }
//
//    override func setupViews() {
//        super.setupViews()
//
//        layer.borderColor = Document.grey.cgColor
//        layer.borderWidth = 1
//        layer.cornerRadius = 10
//        clipsToBounds = true
//
//
//        addSubview(bottomView)
//        bottomView.addSubview(itemLabel)
//        bottomView.constrainHeight(30)
//
//        bottomView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
//        itemLabel.centerInSuperview()
//    }
//}

struct IndividualItem {
    let text: String
}
