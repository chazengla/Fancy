//
//  ProfilePageViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 10/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

class ProfilePageViewController: UIViewController {

    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Jack"
        label.font = UIFont(name: Constants.futuraPrimary, size: 20)
        label.textColor = Document.hotPink
        
        return label
    }()
    
    let child = ProfilePageTableView()
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

        // Do any additional setup after loading the view.
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(helloLabel)
        view.addSubview(child.view)
        addChild(child)
        
        helloLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 60, left: 30, bottom: 0, right: 0))
        
        child.didMove(toParent: self)
        child.view.anchor(top: helloLabel.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
    }


}


class ProfileListItemCell: LBTAListCell<ProfileListItem> {
    
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
    
    override var item: ProfileListItem! {
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

struct ProfileListItem {
    let label: String
    let viewController: UIViewController
}


class ProfilePageTableView: LBTAListController<ProfileListItemCell, ProfileListItem>, UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        items = [
            .init(label: "Orders", viewController: OrdersViewController()),
            .init(label: "Settings", viewController: SettingsViewController())
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
        
        
    
}
    
extension UIViewController{
    
    func goTo(vc: UIViewController){
        navigationController?.pushViewController(vc, animated: true)
    }
}



import SwiftUI
struct MainPreview6: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView6().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView6: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview6.ContainerView6>) -> UIViewController {
            return ProfilePageViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview6.ContainerView6.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview6.ContainerView6>) {
            
        }
    }

}

