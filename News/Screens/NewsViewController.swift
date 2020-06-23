//
//  ViewController.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/16/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    enum Section { case main }
    
    private var collectionView: UICollectionView!
    var datasource: UICollectionViewDiffableDataSource<Section, Article>!
    var api: API = NewsAPI()
    var articles = [Article]()
    var filteredArticles = [Article]()
    var isSearchInProgress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticles()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        configureSearchController()
        title = "News"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(loadArticles))
        configureDatasource()
    }
    
    @objc private func loadArticles() {
        showLoadingIndicator()
        api.getArticles { results in
            self.dismissLoadingIndicator()
            switch results {
            case .success(let response):
                self.articles = response.articles
                self.updateData(on: self.articles)
                DispatchQueue.main.async { self.collectionView.reloadData() }
            case .failure(let error):
                DispatchQueue.main.async {
                    let alertVC = AlertViewController(title: "Error", message: error.rawValue)
                    self.present(alertVC, animated: true)
                }
            }
        }
    }
    
     func configureCollectionView() {
        collectionView = UICollectionView(frame: view.frame,
                                          collectionViewLayout: UIHelper.createFlowLayout(in: view))
        view.addSubviews(views: collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: String(describing: ArticleCell.self))
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for an article"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
     func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource<Section, Article>(collectionView: collectionView, cellProvider: { collectionView, indexPath, article -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ArticleCell.self), for: indexPath) as? ArticleCell else { return UICollectionViewCell() }
            cell.backgroundImageView.setImage(from: article.urlToImage)
            cell.authorLabel.text = article.author
            cell.titleLabel.text = article.title
            return cell
        })
    }
    
    private func updateData(on articles: [Article]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Article>()
        snapshot.appendSections([.main])
        snapshot.appendItems(articles)
        DispatchQueue.main.async { self.datasource.apply(snapshot, animatingDifferences: true)  }
    }
}

extension NewsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = isSearchInProgress ? filteredArticles[indexPath.item] : articles[indexPath.item]
        let detailVC = DetailViewController()
        detailVC.set(with: article)
        let navController = UINavigationController(rootViewController: detailVC)
        navController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async { self.present(navController, animated: true) }
    }
}

extension NewsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text?.lowercased() else { return }
        if filter.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isSearchInProgress = false
            updateData(on: self.articles)
            return
        }
        isSearchInProgress = true
        let filteredArticlesByTitle = articles.filter { $0.title.lowercased().contains(filter) }
        let filteredArticlesByAuthor = articles.filter { $0.author.lowercased().contains(filter)}
        let filteredArticlesByDesc = articles.filter { $0.description.lowercased().contains(filter)}
        filteredArticles = Array(Set(filteredArticlesByTitle + filteredArticlesByAuthor + filteredArticlesByDesc))
        updateData(on: filteredArticles)
        
    }
}

