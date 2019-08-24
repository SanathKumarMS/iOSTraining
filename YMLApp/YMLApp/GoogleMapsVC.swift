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

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 48.857165, longitude: 2.354613, zoom: 8.0)
        mapView.camera = camera
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
