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
        
    }
}
