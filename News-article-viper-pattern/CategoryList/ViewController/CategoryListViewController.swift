//
//  CategoryListViewController.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import UIKit

class CategoryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CategoryPresenterInputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }

    func initData() {
        title   = "News API"
        presenter.fetchCategory()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.removeExcessCells()
        tableView.registerCell(type: CategoryTableViewCell.self, identifier: CategoryTableViewCell.identifier)
    }
}

extension CategoryListViewController: CatagoryViewProtocol {
    func showCategory() {
        tableView.reloadData()
    }
}


extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: CategoryTableViewCell.self, for: indexPath) as! CategoryTableViewCell
        
        let category = presenter.selectCategory(at: indexPath)
        cell.set(category: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushToSourceList(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
