//
//  WebViewController.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/20/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var url: URL!
    var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        return webView
    }()
    
    
    init(url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.url = url
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubviews(views: webView)
        webView.uiDelegate = self
        view = webView
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        let forwardBarItem = UIBarButtonItem(title: "Forward", style: .plain, target: self, action: #selector(moveForward))
        let backBarItem = UIBarButtonItem(title: "Backward", style: .plain, target: self, action: #selector(moveBackward))
        navigationItem.leftBarButtonItem = backBarItem
        navigationItem.rightBarButtonItem = forwardBarItem
        navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissWebView))
        let closeButton = Button(title: "Close", backgroundColor: .clear)
        closeButton.setTitleColor(.systemPink, for: .normal)
        closeButton.addTarget(self, action: #selector(dismissWebView), for: .touchUpInside)
        navigationItem.titleView = closeButton
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveBackward))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveBackward))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        webView.addGestureRecognizer(leftSwipe)
        webView.addGestureRecognizer(rightSwipe)
    }
    
    @objc func moveForward() {
        if webView.canGoForward { webView.goForward() }
    }
    
    @objc func moveBackward() {
        if webView.canGoBack { webView.goBack() }
    }

    @objc func dismissWebView() {
        self.dismiss(animated: true)
    }

}

extension WebViewController: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.allowsBackForwardNavigationGestures = true
    }
}
