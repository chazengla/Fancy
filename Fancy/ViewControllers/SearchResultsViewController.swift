//
//  ItemsViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 25/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools


class SearchHeaderCell: UICollectionReusableView{
    
    let sectionLabel = UILabel(text: "Pepsi", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: .black)
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
        
    }
    
    func setupViews(){
        addSubview(sectionLabel)
        sectionLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class SearchResultsViewController: LBTAListHeaderController<IndividualItemCell, IndividualItem, SearchHeaderCell>, UICollectionViewDelegateFlowLayout {
    
    var headerTitle = "Header"
    fileprivate let supplementaryViewId = "supplementaryViewId"
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
        
        navigationItem.title = "Results"
        
        
        items = [
            .init(text: "Drinks"),
            .init(text: "Sweets"),
            .init(text: "Ice Cream"),
            .init(text: "Booze"),
            .init(text: "Snacks"),
            .init(text: "Essentials"),
            .init(text: "Drinks"),
            .init(text: "Sweets"),
            .init(text: "Ice Cream"),
            .init(text: "Booze"),
            .init(text: "Snacks"),
            .init(text: "Essentials"),
            .init(text: "Drinks"),
            .init(text: "Sweets"),
            .init(text: "Ice Cream"),
            .init(text: "Booze"),
            .init(text: "Snacks"),
            .init(text: "Essentials"),
            .init(text: "Drinks"),
            .init(text: "Sweets"),
            .init(text: "Ice Cream"),
            .init(text: "Booze"),
            .init(text: "Snacks"),
            .init(text: "Essentials"),
        ]
        
        
    }
    
    //sets up header
    override open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath)
           if let header = supplementaryView as? SearchHeaderCell {
               header.sectionLabel.text = headerTitle
           }
           return supplementaryView
       }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 65)
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
        
    
    }
    
    
    

    func setupNav(){
        navigationController?.navigationBar.isHidden = false
        self.title = "Results"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))
        
    }
    

}






import SwiftUI
struct MainPreview13: PreviewProvider {
    static var previews: some View {
//        Text("main preview 133133")
        ContainerView13().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView13: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview13.ContainerView13>) -> UIViewController {
            return SearchResultsViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview13.ContainerView13.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview13.ContainerView13>) {
            
        }
        
    }
        
}
