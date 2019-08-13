//
//  ProgrammaticVC.swift
//  Assignment
//
//  Created by Sanath Kumar M S on 10/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ProgrammaticVC: UIViewController {
    
    var name : String = ""
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI()
    {
        backButton.layer.cornerRadius = 10
        displayNameLabel.center.x = self.view.frame.maxX/2
        backButton.center.x = self.view.frame.maxX/2
        
        //let WillGoBackground = Notification.Name("WillGoBackground")
        NotificationCenter.default.addObserver(self, selector: #selector(onWillGoBackground), name: UIApplication.willResignActiveNotification, object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData), name: .didReceiveData, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if name == ""
        {
            print("Did not read name")
        }
        else
        {
            print("Name in ProgVC : \(name)")
            displayNameLabel?.text = name
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveToCenter()
        //moveToCenter()
    }
    
    func moveToCenter()
    {
        UIView.animate(withDuration: 1, animations: {
            self.displayNameLabel.center.y = self.view.center.y
        })
    }
    
//    @objc func onDidReceiveData(_ notification : Notification){
//        print("Entered notificaiton")
//        if let data = notification.userInfo  as? [String:String]
//        {
//            self.name = data["name"]!
//            print("Name in ProgVC from notification : \(name)")
//            displayNameLabel?.text = name
//        }
//    }
    
    @objc func onWillGoBackground(_ notification : Notification){
        self.view.backgroundColor = UIColor.red
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

//extension Notification.Name{
//    static let WillGoBackground = Notification.Name("WillGoBackground")
//}
