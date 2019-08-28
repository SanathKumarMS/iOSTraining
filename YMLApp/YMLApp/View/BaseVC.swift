//
//  BaseVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 28/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
import UIKit
import WebKit

struct AlertAction{
    var title: String
    var style: UIAlertAction.Style
}

class BaseVC: UIViewController{
    var webView: WKWebView?
    
    func presentInWebView(urlString: String){
        webView = WKWebView()
        webView?.allowsBackForwardNavigationGestures = true
        if let url = URL(string: urlString){
            webView?.load(URLRequest(url: url))
        }
        self.view = webView
    }
    
    func presentAlert(title: String, message: String, style: UIAlertController.Style, actions: [AlertAction]) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        for item in actions{
            alertController.addAction(UIAlertAction(title: item.title, style: item.style, handler: nil))
        }
        return alertController
    }
    
}
