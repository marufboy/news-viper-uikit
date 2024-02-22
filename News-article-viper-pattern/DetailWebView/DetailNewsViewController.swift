//
//  DetailNewsViewController.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 23/02/24.
//

import UIKit
import WebKit

class DetailNewsViewController: DataLoadingViewController {
    var article: ArticleEntity!
    
    let webview = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        view = webview
        showLoadingView()
        DispatchQueue.main.async {
            self.webview.load(self.article.url)
            self.dismissLoadingView()
        }
    }
}

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
