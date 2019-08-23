//
//  NewsWebViewVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 23/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import WebKit

class NewsWebViewVC: UIViewController {
    
    var webView: WKWebView!
    var url: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.load(URLRequest(url: url))
    }

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
}


extension NewsWebViewVC: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
