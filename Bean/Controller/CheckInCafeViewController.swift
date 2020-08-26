//
//  CheckInCafeViewController.swift
//  Bean
//
//  Created by William Ho on 2020-08-20.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit
import GooglePlaces
import CoreLocation

class CheckInCafeViewController: UIViewController {
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    
    var searchController: UISearchController?
    
    let placesClient = GMSPlacesClient.shared()
    
    var locationManager = CLLocationManager()


    @IBOutlet var searchBar: UISearchBar!
    var currentLoc: CLLocation!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           resultsViewController = GMSAutocompleteResultsViewController()
           resultsViewController?.delegate = self
           
        searchController = UISearchController(searchResultsController: resultsViewController)
           
           
           searchController?.searchResultsUpdater = resultsViewController

           let subView = UIView(frame: CGRect(x: 0, y: 90.0, width: 350, height: 45.0))

           subView.addSubview((searchController?.searchBar)!)
           view.addSubview(subView)
           searchController?.searchBar.sizeToFit()
           searchController?.hidesNavigationBarDuringPresentation = false

           // When UISearchController presents the results view, present it in
           // this view controller, not one further up the chain.
           definesPresentationContext = true
        


        locationManager.requestWhenInUseAuthorization()
        currentLoc = locationManager.location

    }
    
    // Shows the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
        

    }
    
    @IBAction func locationPressed(_ sender: Any) {
        

        
        let testURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(currentLoc.coordinate.latitude),\(currentLoc.coordinate.longitude)&radius=2000&type=cafe&key=\(api_key)"

        print(testURL)
        
        if let url = URL(string: testURL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                self.parseJSON(placesData: safeData)
            }
            }
            task.resume()
            
        }

//        if let url = URL(string: testURL
//            ) {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//               if let data = data {
//                  if let jsonString = String(data: data, encoding: .utf8) {
//                     print(jsonString)
//                  }
//                }
//            }.resume()
//
//    }
    
}
    
    func parseJSON(placesData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PlacesData.self, from: placesData)
            print(decodedData.results)
        } catch {
            print(error)
        }
    }

}

extension CheckInCafeViewController: GMSAutocompleteResultsViewControllerDelegate {
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
           searchController?.isActive = false
         // Do something with the selected place.
         print("Place name: \(place.name)")
         print("Place address: \(place.formattedAddress)")
         print("Place attributions: \(place.attributions)")
        print("Place type \(place.types)")
        print("Place ID \(place.placeID)")
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
            // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
}
