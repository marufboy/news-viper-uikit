//
//  CategoryListRouter.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class CategoryListRouter: CategoryRouterProtocol {
    unowned let viewController: CategoryListViewController
    
    required init(viewController: CategoryListViewController) {
        self.viewController = viewController
    }
    
    func pushToSourceList(category: CategoryEntity) {
        let sourceVC            = SourceListViewController()
        let presenter           = SourceListPresenter()
        let interactor          = SourceListInteractor()
        let router              = SourceListRouter(viewController: sourceVC)
            
        sourceVC.presenter      = presenter
        interactor.presenter    = presenter
        
        presenter.view          = sourceVC
        presenter.interactor    = interactor
        presenter.router        = router
        
        //MARK: passing data category
        sourceVC.category       = category
        
        viewController.navigationController?.pushViewController(sourceVC, animated: true)
    }
}
