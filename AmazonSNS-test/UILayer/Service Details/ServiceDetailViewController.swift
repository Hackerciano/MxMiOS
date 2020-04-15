//
//  ServiceDetailViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 12/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit
import MapKit

class ServiceDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    var contractors : [Contractors] = []
    var serviceTitle : String = ""
    var selectedContractor : String = ""
    var selectedUserImg : UIImage?
    
    var profilePics = [#imageLiteral(resourceName: "profile1.png"),#imageLiteral(resourceName: "profile2.jpg"),#imageLiteral(resourceName: "profile5.jpg"),#imageLiteral(resourceName: "profile3.png"),#imageLiteral(resourceName: "profile6.jpg"),#imageLiteral(resourceName: "profile4.png"),#imageLiteral(resourceName: "profile7.jpg")]
    var workers: [String] = ["José Martinez", "Erick Diaz", "Silvia Corona", "Juan García", "Daniela Sanchez", "Mario Torres", "Ana de la torre"]
    var basePrice: [String] = ["$300", "$350", "$200", "$400", "$230", "$320", "$410"]
    var latitudes: [CLLocationDegrees] = [20.759612, 20.764836, 20.770137, 20.781731, 20.777965, 20.787861, 20.796649]
    var longitudes: [CLLocationDegrees] = [-103.440607, -103.423688, -103.447598, -103.445222, -103.416866, -103.430530, -103.429029]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = serviceTitle
        checkLocationServices()
        
        let i = self.workers.count - 1
        for n in 0...i {
            contractors.append(Contractors(name: workers[n], cost: basePrice[n], latitude: latitudes[n], longitude: longitudes[n]))
        }
        fetchContractorsOnMap(contractors)
        
        
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        // Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }

        self.locationManager = locationManager

        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        
    }
    
    // ***************************
    // MARK: Config Map View
    // ***************************
    
    func fetchContractorsOnMap(_ contractors: [Contractors]) {
        for contractor in contractors {
            let annotations = MKPointAnnotation()
            annotations.title = contractor.name
            annotations.coordinate = CLLocationCoordinate2D(latitude: contractor.latitude, longitude: contractor.longitude)
            map.addAnnotation(annotations)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
        // Show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                map.showsUserLocation = true
            case .denied: // Show alert telling users how to turn on permissions
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                map.showsUserLocation = true
            case .restricted: // Show an alert letting them know what’s up
                break
            case .authorizedAlways:
                break
        @unknown default:
            break
        }
    }
    
    // ***************************
    // MARK: Table View
    // ***************************
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "servicesCell", for: indexPath)
        cell.textLabel?.text = workers[indexPath.row]
        cell.detailTextLabel?.text = "Precio base :" + basePrice[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedContractor = workers[indexPath.row]
        selectedUserImg = profilePics[indexPath.row]
        performSegue(withIdentifier: "requestServiceSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "requestServiceSegue" {
            if let destination = segue.destination as? RequestServiceViewController {
                destination.passedContractorName = selectedContractor
                destination.passedContractorPic = selectedUserImg
            }
        }
    }

}


extension ServiceDetailViewController: CLLocationManagerDelegate {
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
      let location = locations.last! as CLLocation
      let currentLocation = location.coordinate
      let coordinateRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 4500, longitudinalMeters: 4500)
      map.setRegion(coordinateRegion, animated: true)
      locationManager.stopUpdatingLocation()
   }
   func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print(error.localizedDescription)
   }
}
