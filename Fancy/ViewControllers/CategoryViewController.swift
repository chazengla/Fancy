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



class CategoryViewController: LBTAListHeaderController<IndividualItemCell, IndividualItem, SectionCell>, UICollectionViewDelegateFlowLayout {
    
    let filters = FilterCollectionViewController()
    let transparentView = UIView()
    let child = FilterCollectionViewController()
    let height: CGFloat = 250
    let sectionID = "SectionID"

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
        
        checkIfFilterApplied()
        navigationItem.title = "Messages"
        
       
        collectionView.register(SectionCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: sectionID)
        
        
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
        
    
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: sectionID, for: indexPath) as! SectionCell
        supplementaryView.sectionLabel.text = sections[indexPath[0]]
        
        return supplementaryView
        
        
    }
    

    func setupNav(){
        navigationController?.navigationBar.isHidden = false
        self.title = "Drinks"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(filterPressed))
        
    }
    
    //filter button functionality
    @objc func filterPressed(){
        
        let window = UIApplication.shared.keyWindow
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        window?.addSubview(transparentView)

        let screenSize = UIScreen.main.bounds.size
        child.view.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        child.view.layer.cornerRadius = 20
        child.view.clipsToBounds = true
        window?.addSubview(child.view)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)

        transparentView.alpha = 0

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.child.view.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)

        
        
    }
    
    //filter button functionality
    @objc func onClickTransparentView() {
        print("running")
           let screenSize = UIScreen.main.bounds.size

           UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
               self.transparentView.alpha = 0
               self.child.view.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
           }, completion: nil)
        
        checkIfFilterApplied()
        
      
       }
    
    func checkIfFilterApplied(){
        
        if child.selectedArray.count > 0 {
            print()
            print("Filters applied")
        }
    }
    

}




import SwiftUI
struct MainPreview12: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView12().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView12: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview12.ContainerView12>) -> UIViewController {
            return CategoryViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview12.ContainerView12.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview12.ContainerView12>) {
            
        }
        
    }
        
}
