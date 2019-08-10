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
    
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
