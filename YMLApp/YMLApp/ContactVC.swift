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
    
    var address1 = "255 Shoreline Dr, Redwood City, CA 94065, USA"
    var address2 = "150 Old Airport Road, Diamond District, Tower B, Lower Ground Floor, Kodihalli, Domlur, Bengaluru, Karnataka 560008"
    
    
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
        var searchAddress = ""
        if sender == locationTapGesture1{
            searchAddress = address1
        }
        else{
            searchAddress = address2
        }
        
        var components = URLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json")!
        let key = URLQueryItem(name: "key", value: googleApiKey) // use your key
        let address = URLQueryItem(name: "address", value: searchAddress)
        components.queryItems = [key, address]

        let task = URLSession.shared.dataTask(with: components.url!) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, error == nil else {
                print(String(describing: response))
                print(String(describing: error))
                return
            }

            guard let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else {
                print("not JSON format expected")
                print(String(data: data, encoding: .utf8) ?? "Not string?!?")
                return
            }

            guard let results = json["results"] as? [[String: Any]],
                let status = json["status"] as? String,
                status == "OK" else {
                    print("no results")
                    print(String(describing: json))
                    return
            }

//            DispatchQueue.main.async {
//                // now do something with the results, e.g. grab `formatted_address`:
//                let strings = results.compactMap { $0["formatted_address"] as? String }
//            }
        }

        task.resume()
    }
    

    
}
