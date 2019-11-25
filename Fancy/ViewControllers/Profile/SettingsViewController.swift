//
//  OrdersViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 10/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class SettingsViewController: LBTAListController<SettingsListItemCell, SettingListItem>, UICollectionViewDelegateFlowLayout{
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        items = [
            .init(label: "Change phone number", viewController: OrdersViewController()),
            .init(label: "Log out", viewController: LandingPageViewController())
        ]
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        return .init(width: width, height: 45)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goTo(vc: items[indexPath.row].viewController)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 60, left: 0, bottom: 0, right: 0)
    }
    
    func setupNav(){
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "backArrow"), style: .plain, target: self, action: #selector(goBack))

    }
        
        
}

class SettingsListItemCell: LBTAListCell<SettingListItem> {
    
    let itemLabel = UILabel(text: "Drinks", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: .black)
        
    lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Document.grey.withAlphaComponent(0.2)
        view.withHeight(1)
        return view
    }()
    
    let arrowImage: UIImageView = {
        let arrow = UIImageView()
        arrow.image = #imageLiteral(resourceName: "rightArrow").withRenderingMode(.alwaysTemplate)
        arrow.tintColor = Document.grey
        arrow.withSize(.init(width: 20, height: 20))
        return arrow
    }()
    
    override var item: SettingListItem! {
        didSet {
            itemLabel.text = item.label
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
//        backgroundColor = .blue
        
        addSubview(itemLabel)
        addSubview(seperatorView)
        addSubview(arrowImage)
        
        itemLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 30, bottom: 10, right: 0))
        seperatorView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        arrowImage.centerYToSuperview()
        arrowImage.anchor(top: nil, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 30))
        }
    }


struct SettingListItem {
    let label: String
    let viewController: UIViewController
}





import SwiftUI
struct MainPreview8: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView8().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView8: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview8.ContainerView8>) -> UIViewController {
            return SettingsViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview8.ContainerView8.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview8.ContainerView8>) {
            
        }
        
    }
        
}

