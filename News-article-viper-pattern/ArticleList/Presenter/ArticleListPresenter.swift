//
//  ArticleListPresenter.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class ArticleListPresenter: ArticlePresenterInputProtocol {
    weak var view: ArticleViewProtocol!
    var interactor: ArticleListInteractor!
    var router: ArticleRouterProtocol!
    
    func allArticles() {
        interactor.allArticles()
    }
    
    func fetchArticles(source: String, page: Int) {
        interactor.fetchArticles(with: source, page: page)
    }
    
    func count() -> Int {
        interactor.itemCount()
    }
    
    func filterCount() -> Int {
        interactor.filterItemCount()
    }
    
    func selectArticle(at indexPath: IndexPath) -> ArticleEntity {
        interactor.articleItem(at: indexPath)
    }
    
    func selectFilterArticle(at indexPath: IndexPath) -> ArticleEntity {
        interactor.filterArticleItem(at: indexPath)
    }
    
    func pushToDetailWeb(at indexPath: IndexPath) {
        interactor.pushDataToPresenter(at: indexPath)
    }
    
    func searchArticle(with search: String) {
        interactor.searchArticle(with: search)
    }
    
    func hasMoreArticleCount() -> Bool {
        interactor.hasMoreArticleCount()
    }
    
    func removeFilterArticleArray() {
        interactor.removeFilterArticleArray()
    }
}

extension ArticleListPresenter: ArticlePresenterOutputProtocol {
    func presentArticleView(_ article: [ArticleEntity]) {
        view.reloadSourceData()
    }
    
    func presentFilterArticle(_ filterArticle: [ArticleEntity]) {
        view.reloadSourceData()
    }
    
    func presentError(_ error: String) {
        view.displayError(error: error)
    }
    
    func presentToRouterDetailWeb(article: ArticleEntity) {
        router.pushToDetailWeb(article: article)
    }
    
    func reloadSourceData() {
        view.reloadSourceData()
    }
    
    func displayLoading() {
        view.showLoadingIndicator()
    }
    
    func dismissDisplayLoading() {
        view.dismissLoadingIndicator()
    }
    
    
}
