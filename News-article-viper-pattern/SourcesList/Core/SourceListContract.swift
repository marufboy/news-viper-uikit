//
//  SourceListContract.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

protocol SourceViewProtocol: AnyObject {
    func reloadSourceData()
    func displayError(error: String)
    func showLoadingIndicator()
    func dismissLoadingIndicator()
}
protocol SourcePresenterInputProtocol: AnyObject {
    func allSources()
    func fetchSource(source: String)
    func count() -> Int
    func filterCount() -> Int
    func selectSource(at indexPath: IndexPath) -> SourceEntity
    func selectFilterSource(at indexPath: IndexPath) -> SourceEntity
    func pushToArticleList(at indexPath: IndexPath)
    func searchSource(with search: String)
    func hasMoreSourceCount() -> Bool
    func removeFilterSourceArray()
}

protocol SourcePresenterOutputProtocol: AnyObject {
    func presentSourceView(_ source: [SourceEntity])
    func presentFilterSource(_ filterSource: [SourceEntity])
    func presentError(_ error: String)
    func presentToRouterArticleList(source: SourceEntity)
    func reloadSourceData()
    func displayLoading()
    func dismissDisplayLoading()
}

protocol SourceInteractorProtocol: AnyObject {
    func allSources()
    func fetchSource(with category: String)
    func itemCount() -> Int
    func filterItemCount() -> Int
    func sourceItem(at indexPath: IndexPath) -> SourceEntity
    func filterSourceItem(at indexPath: IndexPath) -> SourceEntity
    func pushDataToPresenter(at indexPath: IndexPath)
    func searchSource(with search: String)
    func hasMoreSourceCount() -> Bool
    func removeFilterSourceArray()
}

protocol SourceRouterProtocol: AnyObject {
    init(viewController: SourceListViewController)
    func pushToArticleVC(source: SourceEntity)
}
