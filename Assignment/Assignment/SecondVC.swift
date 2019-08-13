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
    @IBOutlet weak var backButton: UIButton!
    var viewblock : UIView!
    var changeToRedButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI()
    {
        //let viewblock = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 100))
        gestureLabel.center.x = self.view.center.x
        backButton.center.x = self.view.frame.maxX/2
        viewblock = UIView()
        viewblock.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        viewblock.backgroundColor = UIColor.gray
        viewblock.center = self.view.center
        self.view.addSubview(viewblock)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeViewColor))
        tapGesture.numberOfTapsRequired = 2
        gestureLabel.isUserInteractionEnabled = true
        gestureLabel.addGestureRecognizer(tapGesture)
        
        backButton.layer.cornerRadius = 10
        
        changeToRedButton = UIButton()
        changeToRedButton.frame = CGRect(x: 0, y: 500, width: 85, height: 45)
        changeToRedButton.center.x = self.view.center.x
        changeToRedButton.layer.cornerRadius = 10
        changeToRedButton.backgroundColor = UIColor.red
        changeToRedButton.layer.borderWidth = 1
        changeToRedButton.layer.borderColor = UIColor.black.cgColor
        changeToRedButton.setTitle("Red", for: .normal)
        changeToRedButton.addTarget(self, action: #selector(changeViewToRed), for: .touchDown)
        self.view.addSubview(changeToRedButton)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onWillGoBackground), name: UIApplication.willResignActiveNotification, object: nil)
        
    }
    
    
    @objc func changeViewColor(sender: UITapGestureRecognizer){
        changeColor()
    }
    
    func changeColor(){
        let randomColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        viewblock.backgroundColor = randomColor
    }
    
    @objc func changeViewToRed(){
        viewblock.backgroundColor = UIColor.red
    }
    
    @objc func onWillGoBackground(_ notification: Notification)
    {
        changeColor()
    }
    
    
    @IBAction func back(){
        dismiss(animated: true, completion: nil)
    }
}
