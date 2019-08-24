//
//  ContactVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {

    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addTapGestures()
        // Do any additional setup after loading the view.
    }
    
    func addTapGestures(){
        let mailTapGesture = UITapGestureRecognizer(target: self, action: #selector(showMailAlert(_:)))
        mailLabel.addGestureRecognizer(mailTapGesture)
        
        let contactTapGesture = UITapGestureRecognizer(target: self, action: #selector(showCallAlert(_:)))
        contactLabel.addGestureRecognizer(contactTapGesture)
        
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
        if let phoneURL = NSURL(string: ("tel://\(phoneNumber)")) {
            
            let alert = UIAlertController(title: ("Call " + "8152024536" + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    
}
