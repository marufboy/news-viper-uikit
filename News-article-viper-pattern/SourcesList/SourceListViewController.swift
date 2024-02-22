//
//  SourceListViewController.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import UIKit

class SourceListViewController: ViewController {

    var tableView: UITableView!
    let searchController  = UISearchController()
    
    //SETUP Presenter
    var presenter: SourcePresenterInputProtocol!
    
    var category: CategoryEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func initData() {
        title   = "News Sources"
        setupTableView()
        setupSearchController()
        if let categoryItemName = category.name {
            presenter.fetchSource(source: categoryItemName)
        }
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView               = UITableView(frame: view.bounds)
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.registerCell(type: SourceTableViewCell.self, identifier: SourceTableViewCell.identifier)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater       = self
        searchController.searchBar.delegate         = self
        searchController.searchBar.placeholder      = "Search source"
        navigationItem.searchController             = searchController
    }

}

extension SourceListViewController: SourceViewProtocol {
    func reloadSourceData() {
        dismissLoadingView()
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

extension SourceListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? presenter.filterCount() : presenter.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: SourceTableViewCell.self, for: indexPath) as! SourceTableViewCell
        
        let source = searchController.isActive ? presenter.selectFilterSource(at: indexPath) : presenter.selectSource(at: indexPath)
        
        cell.set(source: source)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushToArticleList(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension SourceListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        presenter.searchSource(with: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        showLoadingIndicator()
        presenter.removeFilterSourceArray()
        presenter.fetchSource(source: category.name ?? "")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        guard let isEmpty =  searchController.searchBar.text?.isEmpty else { return }
        if isEmpty {
            presenter.removeFilterSourceArray()
            presenter.fetchSource(source: category.name ?? "")
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        presenter.allSources()
    }
}
