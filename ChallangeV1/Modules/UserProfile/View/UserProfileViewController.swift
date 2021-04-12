//
//  UserProfileViewController.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import UIKit
import MapKit

class UserProfileViewController: UIViewController {

    // Attributes
    var presenter: UserProfilePresenterProtocol?
    
    // Outlets
    // Map
    @IBOutlet weak var mapView: MKMapView!
    
    // User Details
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userCityLabel: UILabel!
    @IBOutlet weak var userStreetLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    // More Details
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userCompanyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let user = presenter?.viewModel.user
        userNameLabel.text = user?.name ?? ""
        userCityLabel.text = user?.address?.city ?? ""
        userStreetLabel.text = user?.address?.street ?? ""
        userEmailLabel.text = user?.email ?? ""
        userPhoneLabel.text = user?.phone ?? ""
        userCompanyLabel.text = user?.company?.name ?? ""
        showUserLocation(cor: user?.address?.geo ?? Coordinates())
    }
    
    @IBAction func backAction(_ sender: Any) {
        presenter?.back()
    }
}

//MARK: - UserProfileViewControllerProtocol
extension UserProfileViewController: UserProfileViewControllerProtocol {
}

//MARK: - Map Setup
extension UserProfileViewController {
    func showUserLocation(cor: Coordinates){
        let coordinates = CLLocationCoordinate2D(latitude: Double(cor.lat) ?? 0, longitude: Double(cor.lng) ?? 0)
        let sp = MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
        let region = MKCoordinateRegion(center: coordinates, span: sp)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
    }
}
