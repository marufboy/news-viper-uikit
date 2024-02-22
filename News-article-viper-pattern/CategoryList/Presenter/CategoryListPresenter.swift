//
//  CategoryListPresenter.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class CategoryListPresenter: CategoryPresenterInputProtocol {
    weak var view: CatagoryViewProtocol!
    var interactor: CategoryListInteractor!
    var router: CategoryRouterProtocol!
    
    func fetchCategory() {
        interactor.initData()
    }
    
    func count() -> Int {
        interactor.itemCount()
    }
    
    func selectCategory(at indexPath: IndexPath) -> CategoryEntity {
        interactor.categoryItem(at: indexPath)
    }
    
    func pushToSourceList(at indexPath: IndexPath) {
        interactor.pushDataToPresenter(at: indexPath)
    }
}

extension CategoryListPresenter: CategoryPresenterOutputProtocol {
    func presentCategoryView(items: [CategoryEntity]) {
        view.showCategory()
    }
    
    func presentToRouterSourceList(_ category: CategoryEntity) {
        router.pushToSourceList(category: category)
    }
    
    
}
