//
//  ContactVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class ContactVC: BaseVC {

    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var locationLabel1: UILabel!
    @IBOutlet weak var locationLabel2: UILabel!
    var locationTapGesture1: UITapGestureRecognizer!
    var locationTapGesture2: UITapGestureRecognizer!
    var viewModel = ContactsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addTapGestures()
    }
    
    func addTapGestures(){
        let mailTapGesture = UITapGestureRecognizer(target: self, action: #selector(showMailAlert(_:)))
        mailLabel.addGestureRecognizer(mailTapGesture)
        
        let contactTapGesture = UITapGestureRecognizer(target: self, action: #selector(showCallAlert(_:)))
        contactLabel.addGestureRecognizer(contactTapGesture)
        
        locationTapGesture1 = UITapGestureRecognizer(target: self, action: #selector(showLocationOnMaps(_:)))
        locationTapGesture2 = UITapGestureRecognizer(target: self, action: #selector(showLocationOnMaps(_:)))
        locationLabel1.addGestureRecognizer(locationTapGesture1)
        locationLabel2.addGestureRecognizer(locationTapGesture2)
        
    }
    
    @objc func showMailAlert(_ sender: UITapGestureRecognizer){
        if let emailaddress = mailLabel.text{
            openApp(rawString: emailaddress, appType: .mail)
            self.presentAlert(title: "Send mail to \(String(describing: emailaddress))?", message: "", style: .alert, actions: [AlertAction(title: "Send", style: .default, handler: nil), AlertAction(title: "Cancel", style: .cancel, handler: nil)])
        }
    }
    
    @objc func showCallAlert(_ sender: UITapGestureRecognizer){
        if let phoneNumber = contactLabel.text{
            openApp(rawString: phoneNumber, appType: .phone)
            self.presentAlert(title: "Call \(String(describing: phoneNumber))?", message: "", style: .alert, actions: [AlertAction(title: "Call", style: .default, handler: nil), AlertAction(title: "Cancel", style: .cancel, handler: nil)])
        }
    }
    
    @objc func showLocationOnMaps(_ sender: UITapGestureRecognizer){
        var lat = 0.0
        var long = 0.0
        if sender == locationTapGesture1{
            lat = viewModel.sanFrancisco.latitude
            long = viewModel.sanFrancisco.longitude
        }
        else{
            lat = viewModel.bangalore.latitude
            long = viewModel.bangalore.longitude
        }
        let appleMaps = AlertAction(title: "Apple Maps", style: .default, handler: {
            (AlertAction) in
//            let query = "?daddr=\(String(describing: lat)),\(String(describing: long))"
//                print(query)
//                let mapURL = "http://maps.apple.com/\(query)&dirflg=d&t=h"
//                if let url = URL(string: mapURL){
//                    if UIApplication.shared.canOpenURL(url){
//                        UIApplication.shared.open(url)
//                    }
//                }
            self.openApp(rawString: "", appType: .appleMaps, latitude: lat, longitude: long)
        })
        
        let googleMaps = AlertAction(title: "Google Maps", style: .default, handler: {
            (AlertAction) in
//            let mapURL = "comgooglemaps://?saddr=&daddr=\(String(describing: lat)),\(String(describing: long))&directionsmode=driving"
//            print(mapURL)
//            if let url = URL(string: mapURL){
//                if UIApplication.shared.canOpenURL(url){
//                    UIApplication.shared.open(url)
//                }
//            }
            self.openApp(rawString: "", appType: .googleMaps, latitude: lat, longitude: long)
        })
        let cancel = AlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        presentAlert(title: "Open location", message: "", style: .actionSheet, actions: [appleMaps, googleMaps, cancel])
    }
}



extension ContactVC{
    
    func openApp(rawString: String, appType: AppType, latitude: Double? = nil, longitude: Double? = nil){
        var urlString = rawString
        switch appType {
        case .phone:
            urlString = "tel://" + urlString
        case .mail:
            urlString = "mailto:" + urlString
        case .appleMaps:
            if let latitude = latitude, let longitude = longitude{
                let query = "?daddr=\(String(describing: latitude)),\(String(describing: longitude))"
                urlString = "http://maps.apple.com/\(query)&dirflg=d&t=h"
            }
        case .googleMaps:
            if let latitude = latitude, let longitude = longitude{
                urlString = "comgooglemaps://?saddr=&daddr=\(String(describing: latitude)),\(String(describing: longitude))&directionsmode=driving"
            }
        }
        if let url = URL(string: urlString){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url) 
            }
        }
    }
}


enum AppType
{
    case phone
    case mail
    case appleMaps
    case googleMaps
}
