//
//  WebVIewVC-Extension+WKNavigationDelegate.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import WebKit

extension WebViewVC: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
