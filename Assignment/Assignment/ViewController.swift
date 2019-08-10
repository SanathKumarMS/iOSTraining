//
//  ViewController.swift
//  Assignment
//
//  Created by Sanath Kumar M S on 08/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = nameField.text ?? ""
        print(name)
        if segue.destination is ThirdVC
        {
            let thirdViewController = segue.destination as? ThirdVC
            thirdViewController?.text = name
        }
    }

}

