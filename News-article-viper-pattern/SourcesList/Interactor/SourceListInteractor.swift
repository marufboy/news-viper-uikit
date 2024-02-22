//
//  SourceListInteractor.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class SourceListInteractor: SourceInteractorProtocol {
    private var sources: [SourceEntity]         = []
    private var filterSource: [SourceEntity]    = []
    
    var hasMoreSource = true
    
    weak var presenter: SourcePresenterOutputProtocol!
    
    private let service = NetworkManager(service: NetworkHelper())
    
    func fetchSource(with category: String) {
        presenter.displayLoading()
        DispatchQueue.main.async {
            self.service.getSource(endpoint: .getNewsSourcesFromCategory(category)) { [weak self] result in
                guard let self = self else { return }
                presenter.dismissDisplayLoading()
                switch result {
                case .success(let sources):
                    self.sources = sources
                    if sources.count < 20 { self.hasMoreSource = false }
                    self.presenter.presentSourceView(sources)
                case .failure(let error):
                    self.presenter.presentError(error.rawValue)
                }
            }
        }
    }
    
    func allSources() {
        sources = filterSource
        presenter.reloadSourceData()
    }
    
    func itemCount() -> Int {
        return sources.count
    }
    
    func filterItemCount() -> Int {
        return filterSource.count
    }
    
    func sourceItem(at indexPath: IndexPath) -> SourceEntity {
        return sources[indexPath.row]
    }
    
    func filterSourceItem(at indexPath: IndexPath) -> SourceEntity {
        return filterSource[indexPath.row]
    }
    
    func pushDataToPresenter(at indexPath: IndexPath) {
        let source = sources[indexPath.row]
        presenter.presentToRouterArticleList(source: source)
    }
    
    func searchSource(with search: String) {
        filterSource = sources.filter { $0.name.lowercased().contains(search.lowercased()) }
        presenter.presentFilterSource(filterSource)
    }
    
    func hasMoreSourceCount() -> Bool {
        return hasMoreSource
    }
    
    func removeFilterSourceArray() {
        filterSource.removeAll()
    }
    
    
}
