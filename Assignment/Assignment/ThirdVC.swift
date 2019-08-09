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
    
    var completionHandler :((String) -> String)?
    
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let def = "def"
//        label.text = text
//        print("Label : \(label.text ?? def)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        label.text = text
        //let def = "def"
        
        if label.text == ""
        {
            print("Did not read")
        }
        else
        {
            print("Label \(label.text!)")
        }
    
    }
    

    @IBAction func back()
    {
        dismiss(animated: true, completion: nil)
    }
    
}
