//
//  WorkWebViewVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 22/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import WebKit

class WorkWebViewVC: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var url: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let url = URL(string: "https://ioscreator.com")!
        webView.load(URLRequest(url: url))
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = webView.title
//    }

}
