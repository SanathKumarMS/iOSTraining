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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
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
        UIView.animate(withDuration: 1, animations: {
            self.displayNameLabel.center.y += 200
        })
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
