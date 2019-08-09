//
//  ThirdVC.swift
//  Assignment
//
//  Created by Sanath Kumar M S on 09/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    
    var text : String = ""
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let def = "def"
        
        label.text = text
        
        print("Label : \(label.text ?? def)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let def = "def"
        
        label.text = text
        
        print("Label : \(label.text ?? def)")
    }

    @IBAction func back()
    {
        dismiss(animated: true, completion: nil)
    }
    
}
