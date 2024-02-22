//
//  CategoryListContract.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

protocol CatagoryViewProtocol: AnyObject {
    func showCategory()
}

protocol CategoryPresenterInputProtocol: AnyObject{
    func fetchCategory()
    func count() -> Int
    func selectCategory(at indexPath: IndexPath) -> CategoryEntity
    func pushToSourceList(at indexPath: IndexPath)
}

protocol CategoryPresenterOutputProtocol: AnyObject{
    //present to view
    func presentCategoryView(items: [CategoryEntity])
    //present to router
    func presentToRouterSourceList(_ category: CategoryEntity)
}

protocol CategoryInteractorProtocol: AnyObject{
    func initData()
    func itemCount() -> Int
    func categoryItem(at indexPath: IndexPath) -> CategoryEntity
    func pushDataToPresenter(at indexPath: IndexPath)
}

protocol CategoryRouterProtocol: AnyObject{
    init(viewController: CategoryListViewController)
    func pushToSourceList(category: CategoryEntity)
}
