//
//  ArticleListContract.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

protocol ArticleViewProtocol: AnyObject {
    func reloadSourceData()
    func displayError(error: String)
    func showLoadingIndicator()
    func dismissLoadingIndicator()
}

protocol ArticlePresenterInputProtocol: AnyObject {
    func allArticles()
    func fetchArticles(source: String, page: Int)
    func count() -> Int
    func filterCount() -> Int
    func selectArticle(at indexPath: IndexPath) -> ArticleEntity
    func selectFilterArticle(at indexPath: IndexPath) -> ArticleEntity
    func pushToDetailWeb(at indexPath: IndexPath)
    func searchArticle(with search: String)
    func hasMoreArticleCount() -> Bool
    func removeFilterArticleArray()
}

protocol ArticlePresenterOutputProtocol: AnyObject {
    func presentArticleView(_ article: [ArticleEntity])
    func presentFilterArticle(_ filterArticle: [ArticleEntity])
    func presentError(_ error: String)
    func presentToRouterDetailWeb(article: ArticleEntity)
    func reloadSourceData()
    func displayLoading()
    func dismissDisplayLoading()
}
protocol ArticleInteractorProtocol: AnyObject {
    func allArticles()
    func fetchArticles(with source: String, page: Int)
    func itemCount() -> Int
    func filterItemCount() -> Int
    func articleItem(at indexPath: IndexPath) -> ArticleEntity
    func filterArticleItem(at indexPath: IndexPath) -> ArticleEntity
    func pushDataToPresenter(at indexPath: IndexPath)
    func searchArticle(with search: String)
    func hasMoreArticleCount() -> Bool
    func removeFilterArticleArray()
}
protocol ArticleRouterProtocol: AnyObject {
    init(viewController: ArticleListViewController)
    func pushToDetailWeb(article: ArticleEntity)
}
