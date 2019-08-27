//
//  GoogleMapsVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapsVC: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    var latitude: Double = 12.9715
    var longitude: Double = 77.5945
    var marker = GMSMarker()

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 5.0)
        mapView.camera = camera
        
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.map = mapView
        
    }

}
