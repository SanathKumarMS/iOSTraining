//
//  MainVC.swift
//  Assignment
//
//  Created by Sanath Kumar M S on 10/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func programmaticTransition(_ sender: Any) {
        name = nameField.text ?? "Did not read"
        let transitionToVC = self.storyboard?.instantiateViewController(withIdentifier: "programvc") as! ProgrammaticVC
        transitionToVC.name = name
        self.present(transitionToVC, animated: true, completion: nil)
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
