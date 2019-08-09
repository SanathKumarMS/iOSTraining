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
    
    
    @IBAction func getName(_ sender: Any) {
        let name = nameField!.text
        
        let thirdVC = ThirdVC(nibName: "ThirdVC", bundle: nil)
        thirdVC.text = name!
    
        print(name!)
    }
    
    
    @IBAction func programTransition(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

