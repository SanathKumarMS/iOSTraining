//
//  MainVC.swift
//  Assignment
//
//  Created by Sanath Kumar M S on 10/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var segueTransitionButton: UIButton!
    @IBOutlet weak var progTransitionButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI()
    {
        titleLabel.center.x = self.view.frame.maxX/2
        logo.center.x = self.view.frame.maxX/2
        descriptionLabel?.center.x = self.view.frame.maxX/2
        segueTransitionButton.center.x = self.view.frame.origin.x + 130
        progTransitionButton.center.x = self.view.frame.maxX - 130
        print(self.view.frame.maxX)
        //segueTransitionButton.backgroundColor = .clear
        segueTransitionButton.layer.cornerRadius = 10
        //segueTransitionButton.layer.borderColor = UIColor.black.cgColor
        progTransitionButton.layer.cornerRadius = 10
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        view.addGestureRecognizer(tapGesture)
        self.nameField.delegate = self
        
    }
    
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool
    {
        print("Inside return")
        textField.resignFirstResponder()
        //self.view.endEditing(true)
        return true
    }
    
//    @objc func hideKeyboard() {
//        view.endEditing(true)
//    }
    
    @IBAction func programmaticTransition(_ sender: Any) {
        name = nameField.text ?? "Did not read"
        let transitionToVC = self.storyboard?.instantiateViewController(withIdentifier: "programvc") as! ProgrammaticVC
        transitionToVC.name = name
        transitionToVC.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        
        self.present(transitionToVC, animated: true, completion: nil)
//        self.present(transitionToVC, animated: true) {
//            NotificationCenter.default.post(name: .didReceiveData, object: self, userInfo: ["name" : self.name])
//        }
    }
    

    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        name = nameField.text ?? ""
    //        print(name)
    //        if segue.destination is ThirdVC
    //        {
    //            let thirdViewController = segue.destination as? ThirdVC
    //            thirdViewController?.text = name
    //        }
    //    }
    
}


extension Notification.Name{
    static let didReceiveData = Notification.Name("didReceiveData")
}
