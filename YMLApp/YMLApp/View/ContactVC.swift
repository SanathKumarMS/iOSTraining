//
//  ContactVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
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
            self.presentAlert(title: "Send mail to \(String(describing: emailaddress))?", message: "", style: .alert, actions: [AlertAction(title: "Send", style: .default), AlertAction(title: "Cancel", style: .cancel)])
        }
    }
    
    @objc func showCallAlert(_ sender: UITapGestureRecognizer){
        if let phoneNumber = contactLabel.text{
            openApp(rawString: phoneNumber, appType: .phone)
            self.presentAlert(title: "Call \(String(describing: phoneNumber))?", message: "", style: .alert, actions: [AlertAction(title: "Call", style: .default), AlertAction(title: "Cancel", style: .cancel)])
        }
    }
    
    @objc func showLocationOnMaps(_ sender: UITapGestureRecognizer){
        
        if sender == locationTapGesture1{
            if let googleMapsVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: GoogleMapsVC.self)) as? GoogleMapsVC
            {
                googleMapsVC.latitude = Double(viewModel.sanFrancisco.latitude)
                googleMapsVC.longitude = Double(viewModel.sanFrancisco.longitude)
                googleMapsVC.marker.title = "California"
                googleMapsVC.marker.snippet = "USA"
                self.navigationController?.pushViewController(googleMapsVC, animated: true)
            }
        }
        else{
            if let googleMapsVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: GoogleMapsVC.self)) as? GoogleMapsVC
            {
                googleMapsVC.latitude = Double(viewModel.bangalore.latitude)
                googleMapsVC.longitude = Double(viewModel.bangalore.longitude)
                googleMapsVC.marker.title = "Bangalore"
                googleMapsVC.marker.snippet = "India"
                self.navigationController?.pushViewController(googleMapsVC, animated: true)
            }
        }
    }
}



extension ContactVC{
    
    func openApp(rawString: String, appType: AppType){
        var urlString = rawString
        switch appType {
        case .phone:
            urlString = "tel://" + urlString
        case .mail:
            urlString = "mailto:" + urlString
        }
        if let url = URL(string: urlString){
            if UIApplication.shared.canOpenURL(url) == true{
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}


enum AppType
{
    case phone
    case mail
}
