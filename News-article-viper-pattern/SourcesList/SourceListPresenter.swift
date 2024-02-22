//
//  SourceListPresenter.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class SourceListPresenter: SourcePresenterInputProtocol {
    weak var view: SourceViewProtocol!
    var interactor: SourceInteractorProtocol!
    var router: SourceRouterProtocol!
    
    func fetchSource(source: String) {
        interactor.fetchSource(with: source)
    }
    
    func allSources() {
        interactor.allSources()
    }
    
    func count() -> Int {
        interactor.itemCount()
    }
    
    func filterCount() -> Int {
        interactor.filterItemCount()
    }
    
    func selectSource(at indexPath: IndexPath) -> SourceEntity {
        interactor.sourceItem(at: indexPath)
    }
    
    func selectFilterSource(at indexPath: IndexPath) -> SourceEntity {
        interactor.filterSourceItem(at: indexPath)
    }
    
    func pushToArticleList(at indexPath: IndexPath) {
        interactor.pushDataToPresenter(at: indexPath)
    }
    
    func searchSource(with search: String) {
        interactor.searchSource(with: search)
    }
    
    func hasMoreSourceCount() -> Bool {
        interactor.hasMoreSourceCount()
    }
    
    func removeFilterSourceArray() {
        interactor.removeFilterSourceArray()
    }
}

extension SourceListPresenter: SourcePresenterOutputProtocol {
    func presentSourceView(_ source: [SourceEntity]) {
        view.reloadSourceData()
    }
    
    func presentFilterSource(_ filterSource: [SourceEntity]) {
        view.reloadSourceData()
    }
    
    func presentError(_ error: String) {
        view.displayError(error: error)
    }
    
    func presentToRouterArticleList(source: SourceEntity) {
        router.pushToArticleVC(source: source)
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
