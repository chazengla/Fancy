//
//  ItemsViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 25/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class SectionCell: UICollectionReusableView{
    
    let sectionLabel = UILabel(text: "Soda Drinks", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: .black)
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
        
    }
    
    func setupViews(){
        addSubview(sectionLabel)
        sectionLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ItemsViewController: LBTAListHeaderController<IndividualItemCell, IndividualItem, SectionCell>, UICollectionViewDelegateFlowLayout {

    let sections = [
        "Soda Drinks",
        "Energy Drinks",
        "Hot Drinks",
        "Health Drinks",
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 65)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Messages"
        collectionView.register(SectionCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionID")
        
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
        
        let width = (view.frame.width-40)/3.1
        return .init(width: width, height: 130)
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        goTo(vc: ItemsViewController())
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionID", for: indexPath) as! SectionCell
        supplementaryView.sectionLabel.text = sections[indexPath[0]]
        
        return supplementaryView
        
        
    }
    
    
    
    
        

        

        // Do any additional setup after loading the view.


    func setupNav(){
        navigationController?.navigationBar.isHidden = false
        self.title = "Drinks"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))

    }
    

}

class IndividualItemCell: LBTAListCell<IndividualItem> {
    
    let itemLabel = UILabel(text: "ADD", font: UIFont(name: Constants.futuraBold, size: 15), textColor: .white, textAlignment: .center)
    let bottomView = UIView(backgroundColor: Document.mintGreen)
    
    
//    override var item: IndividualItem! {
//        didSet {
//            itemLabel.text = item.text
//        }
//    }
    
    override func setupViews() {
        super.setupViews()
        
        layer.borderColor = Document.grey.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        clipsToBounds = true
        
        
        addSubview(bottomView)
        bottomView.addSubview(itemLabel)
        bottomView.constrainHeight(30)
        
        bottomView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        itemLabel.centerInSuperview()
    }
}

struct IndividualItem {
    let text: String
}




import SwiftUI
struct MainPreview12: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView12().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView12: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview12.ContainerView12>) -> UIViewController {
            return ItemsViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview12.ContainerView12.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview12.ContainerView12>) {
            
        }
        
    }
        
}
