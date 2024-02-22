//
//  ArticleListViewController.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import UIKit

class ArticleListViewController: DataLoadingViewController {

    var tableView: UITableView!
    let searchController    = UISearchController()
    
    var presenter: ArticlePresenterInputProtocol!
    var source: SourceEntity!
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }

    private func initData() {
        title   = "Article News"
        setupTableView()
        setupSearchController()
        presenter.fetchArticles(source: source.id, page: page)
    }
    
    func setupTableView() {
        tableView                   = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        tableView.delegate          = self
        tableView.dataSource        = self
        tableView.separatorStyle    = .none
        tableView.registerCell(type: ArticleTableViewCell.self, identifier: ArticleTableViewCell.identifier)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater       = self
        searchController.searchBar.delegate         = self
        searchController.searchBar.placeholder      = "Search source"
        navigationItem.searchController             = searchController
    }
}

extension ArticleListViewController: ArticleViewProtocol {
    func reloadSourceData() {
        tableView.reloadData()
    }
    
    func displayError(error: String) {
        presentAlert(withTitle: "Error Message", message: error)
    }
    
    func showLoadingIndicator() {
        showLoadingView()
    }
    
    func dismissLoadingIndicator() {
        dismissLoadingView()
    }
}

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? presenter.filterCount() : presenter.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: ArticleTableViewCell.self, for: indexPath) as! ArticleTableViewCell
        
        let article = searchController.isActive ? presenter.selectFilterArticle(at: indexPath) : presenter.selectArticle(at: indexPath)
        
        cell.set(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushToDetailWeb(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let contentY            = scrollView.contentOffset.y
        let height              = scrollView.contentSize.height
        let scrollViewHeight    = scrollView.frame.size.height
        
        if contentY > height - scrollViewHeight {
            guard presenter.hasMoreArticleCount() else { return }
            page += 1
            
            self.presenter.fetchArticles(source: self.source.id, page: self.page)
            self.tableView.reloadData()
        }
    }
}

extension ArticleListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        presenter.searchArticle(with: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.removeFilterArticleArray()
        presenter.fetchArticles(source: source.name, page: page)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        guard let isEmpty =  searchController.searchBar.text?.isEmpty else { return }
        if isEmpty {
            presenter.removeFilterArticleArray()
            presenter.fetchArticles(source: source.name, page: page)
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        presenter.allArticles()
    }
}
