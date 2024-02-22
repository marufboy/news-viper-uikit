//
//  ArticleListInteractor.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class ArticleListInteractor: ArticleInteractorProtocol {
    private var articles: [ArticleEntity] = []
    private var filterArticles: [ArticleEntity] = []
    
    var hasMoreArticle = true
    
    weak var presenter: ArticlePresenterOutputProtocol!
    
    private let service = NetworkManager(service: NetworkHelper())
    
    func allArticles() {
        articles = filterArticles
        presenter.reloadSourceData()
    }
    
    func fetchArticles(with source: String, page: Int) {
        presenter.displayLoading()
        DispatchQueue.main.async {
            self.service.getArticle(endpoint: .getNewsArticlesFromSource(source, page)) { [weak self] result in
                guard let self = self else { return }
                presenter.dismissDisplayLoading()
                switch result {
                case .success(let articles):
                    self.articles = articles
                    if articles.count < 20 { self.hasMoreArticle = false }
                    self.presenter.presentArticleView(articles)
                case .failure(let error):
                    self.presenter.presentError(error.rawValue)
                }
            }
        }
    }
    
    func itemCount() -> Int {
        return articles.count
    }
    
    func filterItemCount() -> Int {
        return filterArticles.count
    }
    
    func articleItem(at indexPath: IndexPath) -> ArticleEntity {
        return articles[indexPath.row]
    }
    
    func filterArticleItem(at indexPath: IndexPath) -> ArticleEntity {
        return filterArticles[indexPath.row]
    }
    
    func pushDataToPresenter(at indexPath: IndexPath) {
        let article = articles[indexPath.row]
        presenter.presentToRouterDetailWeb(article: article)
    }
    
    func searchArticle(with search: String) {
        filterArticles = articles.filter { $0.title.lowercased().contains(search.lowercased()) }
        presenter.presentFilterArticle(filterArticles)
    }
    
    func hasMoreArticleCount() -> Bool {
        return hasMoreArticle
    }
    
    func removeFilterArticleArray() {
        filterArticles.removeAll()
    }
}
