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
    var completionHandler :((String) -> String)?
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = text
        if label.text == ""
        {
            print("Did not read")
        }
        else
        {
            print("Label : \(label.text!)")
        }
    }
    

    @IBAction func back()
    {
        dismiss(animated: true, completion: nil)
    }
    
}
