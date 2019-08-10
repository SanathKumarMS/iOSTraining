//
//  SecondVC.swift
//  Assignment
//
//  Created by Sanath Kumar M S on 08/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    
    @IBOutlet weak var gestureLabel: UILabel!
    
    var viewblock : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI()
    {
        //let viewblock = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 100))
        viewblock = UIView()
        viewblock.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        viewblock.backgroundColor = UIColor.gray
        viewblock.center = self.view.center
        self.view.addSubview(viewblock)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeViewColor))
        tapGesture.numberOfTapsRequired = 1
        gestureLabel.isUserInteractionEnabled = true
        gestureLabel.addGestureRecognizer(tapGesture)
        
    }
    
    
    @objc func changeViewColor(sender: UITapGestureRecognizer)
    {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        viewblock.backgroundColor = randomColor
    }
    
    
    @IBAction func back()
    {
        dismiss(animated: true, completion: nil)
    }
}
