//
//  CategoryListBuilder.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import UIKit

class CategoryListBuilder: BuildModuleProtocol {
    static func build() -> UINavigationController {
        let viewController          = CategoryListViewController()
        let presenter               = CategoryListPresenter()
        let interactor              = CategoryListInteractor()
        let router                  = CategoryListRouter(viewController: viewController)
        
        //Setup viewcontroller presenter
        viewController.presenter    = presenter
        //Setup interactor presenter
        interactor.presenter        = presenter
        //Setup presenter view
        //Setup presenter interactor
        //Setup presenter router
        presenter.view              = viewController
        presenter.interactor        = interactor
        presenter.router            = router
        
        
        return UINavigationController(rootViewController: viewController)
    }
}
