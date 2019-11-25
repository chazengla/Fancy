//
//  FiltersViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 11/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools

import UIKit

class FiltersViewController: UIViewController {
    
    var transparentView = UIView()
    
    var tableView = UITableView()
    let child = FilterCollectionViewController()
    let dummyButton = UIButton(title: "Click me", titleColor: Document.hotPink)


    
    let height: CGFloat = 250
    
    var settingArray = ["Profile","Favorite","Notification","Change Password","Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(dummyButton)
        dummyButton.centerInSuperview()
        
        dummyButton.addTarget(self, action: #selector(onPress), for: .touchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func onPress() {
        
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
    
    @objc func onClickTransparentView() {
        let screenSize = UIScreen.main.bounds.size

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.child.view.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    
}



class FilterItemCell: LBTAListCell<FilterItem> {
    
    let itemLabel: UILabel = {
        let label = UILabel(text: "Soda", font: UIFont(name: Constants.futuraPrimary, size: 20), textColor: Document.black)
        label.textAlignment = .center
        return label
    }()
    
    override var item: FilterItem! {
        didSet {
            itemLabel.text = item.text
        }
    }
    
    override func setupViews() {
        super.setupViews()
        

        layer.borderColor = Document.grey.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        clipsToBounds = true
        addSubview(itemLabel)
        itemLabel.centerInSuperview()
    }
}

struct FilterItem {
    let text: String
}

class FilterCollectionViewController: LBTAListController<FilterItemCell, FilterItem>, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        navigationItem.title = "Messages"
        
        items = [
            .init(text: "Soda"),
            .init(text: "Energy"),
            .init(text: "Juice"),
            .init(text: "Water"),
            .init(text: "Tea"),
            .init(text: "Coffee"),
            .init(text: "Milk"),
            .init(text: "Healthy"),
            .init(text: "Mixers"),
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if view.frame.width == 0 {
            return .init(width: 0, height: 0)
        }
        else{
            return .init(width: view.frame.width/3-30, height: view.frame.height/3-50)
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = Document.hotPink
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.backgroundColor = UIColor.white
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 30, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    

    
    
}

import SwiftUI
struct MainPreview11: PreviewProvider {
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView11().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView11: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview11.ContainerView11>) -> UIViewController {
            return FilterCollectionViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview11.ContainerView11.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview11.ContainerView11>) {
            
        }
        
    }
}
