//
//  SourceListRouter.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class SourceListRouter: SourceRouterProtocol {
    unowned let viewController: SourceListViewController
    
    required init(viewController: SourceListViewController) {
        self.viewController = viewController
    }
    
    func pushToArticleVC(source: SourceEntity) {
        let articleVc           = ArticleListViewController()
        let presenter           = ArticleListPresenter()
        let interactor          = ArticleListInteractor()
        let router              = ArticleListRouter(viewController: articleVc)
        
        articleVc.presenter     = presenter
        interactor.presenter    = presenter
        
        presenter.view          = articleVc
        presenter.interactor    = interactor
        presenter.router        = router
        
        //MARK: Passing data source
        articleVc.source        = source
        
        viewController.navigationController?.pushViewController(articleVc, animated: true)
        
    }
}
