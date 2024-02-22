//
//  CategoryListInteractor.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class CategoryListInteractor: CategoryInteractorProtocol {
    weak var presenter: CategoryPresenterOutputProtocol!
    
    //Static data
    let categories: [CategoryEntity] = [
        CategoryEntity(name: Categories.business.rawValue, symbol: Categories.business.symbol),
        CategoryEntity(name: Categories.entertainment.rawValue, symbol: Categories.entertainment.symbol),
        CategoryEntity(name: Categories.general.rawValue, symbol: Categories.general.symbol),
        CategoryEntity(name: Categories.health.rawValue, symbol: Categories.health.symbol),
        CategoryEntity(name: Categories.science.rawValue, symbol: Categories.science.symbol),
        CategoryEntity(name: Categories.sports.rawValue, symbol: Categories.sports.symbol),
        CategoryEntity(name: Categories.technology.rawValue, symbol: Categories.technology.symbol)
    ]

    
    func initData() {
        presenter.presentCategoryView(items: categories)
    }
    
    func itemCount() -> Int {
        return categories.count
    }
    
    func categoryItem(at indexPath: IndexPath) -> CategoryEntity {
        return categories[indexPath.row]
    }
    
    func pushDataToPresenter(at indexPath: IndexPath) {
        let category = categories[indexPath.row]
        presenter.presentToRouterSourceList(category)
    }
}
