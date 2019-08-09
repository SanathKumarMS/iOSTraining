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
    
    @IBAction func getName(_ sender: Any) {
        name = nameField.text ?? ""
        
        //let thirdVC = ThirdVC(nibName: "ThirdVC", bundle: nil)
        //thirdVC.text = name!
    
        print(name)
    }
    
    
    @IBAction func programTransition(_ sender: UIButton) {
        name = nameField.text ?? ""
        print(name)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ThirdVC
        {
            let vc = segue.destination as? ThirdVC
            vc?.text = name
        }
    }


}

