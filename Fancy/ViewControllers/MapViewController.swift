//
//  MapViewController.swift
//  FancyCopy
//
//  Created by Arnie Englander on 22/12/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit
import LBTATools
import MapKit
import CoreLocation

struct Obj: Decodable{
    let status: Int
    let result: Location
}

struct Location: Decodable {
    let longitude: Float
    let latitude: Float

}


class MapViewController: UIViewController {
    
    let regionRadius: CLLocationDistance = 1000
    let mapView = MKMapView()
    
    
    let postcode = "EX46HX"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        
        mapView.fillSuperview()
        print("about to find")
        
        
        fetchCoursesJSON { (res) in
            switch res {
            case .success(let obj):
                let lat = obj.result.latitude
                let long = obj.result.longitude
                let location = CLLocation(latitude: Double(lat), longitude: Double(long))
                self.centerMapOnLocation(location: location)
            case .failure(let err):
                print("Failed to fetch courses:", err)
            }
        }
        
    }
    
    fileprivate func fetchCoursesJSON(completion: @escaping (Result<Obj, Error>) -> ()) {
            
            let urlString = "https://api.postcodes.io/postcodes/\(postcode)"

            guard let url = URL(string: urlString) else {
                print("wrong url")
                return
                
        }
            
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                
                if let err = err {
                    completion(.failure(err))
                    return
                }
                
                // successful
                do {
                    
                    let obj = try JSONDecoder().decode(Obj.self, from: data!)
                    completion(.success(obj))

                    
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
                
                
            }.resume()
        }
    
    func centerMapOnLocation(location: CLLocation) {
        DispatchQueue.main.async {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
            self.mapView.setRegion(coordinateRegion, animated: true)
        }
        
    }
    
    
    
    
    
}

import SwiftUI
struct MainPreview17: PreviewProvider {
    static var previews: some View {
        
        ContainerView17().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView17: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview17.ContainerView17>) -> UIViewController {
            return MapViewController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview17.ContainerView17.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview17.ContainerView17>) {
            
        }
        
    }
    
}
