//
//  ViewController.swift
//  WebViewSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    // TODO: ボタン変数を追加
    let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonTapped))
    let forwardButton = UIBarButtonItem(title: "Forward", style: UIBarButtonItem.Style.plain, target: self, action: #selector(forwardButtonTapped))
    let reloadButton = UIBarButtonItem(title: "Reload", style: UIBarButtonItem.Style.plain, target: self, action: #selector(reloadButtonTapped))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        guard let url = URL(string: "https://github.com/apple") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        
        // TODO: toolbarにボタンを追加
        toolbarItems = [backButton,forwardButton, reloadButton]
        navigationController?.isToolbarHidden = false
        backButton.isEnabled = false
        forwardButton.isEnabled = false

        // TODO: KVOでwebView.canGoBack, webView.canGoForwardを監視
        [#keyPath(WKWebView.canGoBack),
        #keyPath(WKWebView.canGoForward)].forEach { keyPath in
            webView.addObserver(self, forKeyPath: keyPath, options: [.new, .old],
            context: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: toolbarのボタンが押された時の処理
    @objc func backButtonTapped() {
        if (webView.canGoBack) {
            webView.goBack()
        }
    }
    
    @objc func forwardButtonTapped() {
        if (webView.canGoForward) {
            webView.goForward()
        }
    }
    
    @objc func reloadButtonTapped() {
        webView.reload()
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath, let change = change else { return }
        
        if keyPath == #keyPath(WKWebView.canGoBack) {
            guard let current = change[NSKeyValueChangeKey.newKey] as? NSNumber else { return }
            backButton.isEnabled = current.boolValue
        } else if keyPath == #keyPath(WKWebView.canGoForward) {
            guard let current = change[NSKeyValueChangeKey.newKey] as? NSNumber else { return }
            forwardButton.isEnabled = current.boolValue
        }
    }
}

extension ViewController: WKNavigationDelegate {
    // TODO: 読み込み完了のデリゲートメソッド追加、タイトルの変更など
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
