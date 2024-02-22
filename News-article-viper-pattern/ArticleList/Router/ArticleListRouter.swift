//
//  ArticleListRouter.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

class ArticleListRouter: ArticleRouterProtocol {
    unowned let viewController: ArticleListViewController
    
    required init(viewController: ArticleListViewController) {
        self.viewController = viewController
    }
    
    func pushToDetailWeb(article: ArticleEntity) {
        let detailVC        = DetailNewsViewController()
        detailVC.article    = article
        
        viewController.navigationController?.pushViewController(detailVC, animated: true)
    }
}
