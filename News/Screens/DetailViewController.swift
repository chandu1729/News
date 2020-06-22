//
//  DetailViewController.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/18/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    let articleImageView = BackgroundImageView(frame: .zero)
    let authorLabel = TitleLabel(frame: .zero)
    let titleLabel = TitleLabel(frame: .zero)
    let descriptionLabel = BodyLabel(frame: .zero)
    let readMoreButton = Button(title: "Read more......")
    var urlString = ""
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self, action: #selector(dismissVC))
        configureUI()
    }
    
    func set(with article: Article) {
        title = article.publishedAt.convertToDisplayFormat()
        articleImageView.setImage(from: article.urlToImage)
        urlString = article.url
        authorLabel.text = article.author
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
    
    @objc func dismissVC() { dismiss(animated: true) }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubviews(views: articleImageView, authorLabel, titleLabel, descriptionLabel, readMoreButton)
        readMoreButton.addTarget(self, action: #selector(loadWebView), for: .touchUpInside)
        authorLabel.numberOfLines = 1
        authorLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        descriptionLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        NSLayoutConstraint.activate([
            articleImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            articleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            articleImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            articleImageView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.3),
            
            authorLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
            
            readMoreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            readMoreButton.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
            readMoreButton.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
            readMoreButton.heightAnchor.constraint(equalToConstant: 55),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: readMoreButton.topAnchor, constant: -20)
        ])
    }
}

extension DetailViewController: WKNavigationDelegate {
    @objc func loadWebView() {
        guard let url = URL(string: urlString) else { return }
        let webViewController = WebViewController(url: url)
        webView.frame = webViewController.view.bounds
        let navController = UINavigationController(rootViewController: webViewController)
        present(navController, animated: true)
    }
}
