//
//  ContactVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import GoogleMaps

class ContactVC: UIViewController {

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
        let emailaddress = mailLabel.text ?? "invalid email"
        if let mailURL = URL(string: "mailto:\(String(describing: emailaddress))"){
            print(UIApplication.shared.canOpenURL(mailURL))
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(mailURL)
            } else {
                UIApplication.shared.openURL(mailURL)
            }
        }
    
        
        let alert = UIAlertController(title: "Send mail to \(String(describing: emailaddress))?", message: "", preferredStyle: .alert)
        
        let sendAction = UIAlertAction(title: "Send", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(sendAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showCallAlert(_ sender: UITapGestureRecognizer){
        let phoneNumber = contactLabel.text ?? "invalid number"
        if let phoneURL = URL(string: ("tel://\(phoneNumber)")) {
            print(UIApplication.shared.canOpenURL(phoneURL))
            let alert = UIAlertController(title: ("Call \(phoneNumber)"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
