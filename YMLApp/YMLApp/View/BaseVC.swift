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
    var handler: ((UIAlertAction) -> Void)?
}

class BaseVC: UIViewController{
    
    var webView: WKWebView?
    
    func presentInWebView(urlString: String) -> WKWebView{
        webView = WKWebView()
        webView?.frame = view.frame
        //webView?.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
        
        
        if let webView = webView{
            //webView.allowsBackForwardNavigationGestures = true
            if let url = URL(string: urlString){
                webView.load(URLRequest(url: url))
            }
            view.addSubview(webView)
            
        }
        return WKWebView()
    }
    
    func presentAlert(title: String, message: String, style: UIAlertController.Style, actions: [AlertAction]){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        for item in actions{
            alertController.addAction(UIAlertAction(title: item.title, style: item.style, handler: item.handler))
        }
        present(alertController, animated: true, completion: nil)
    }
}
