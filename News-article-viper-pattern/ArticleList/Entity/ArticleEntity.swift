//
//  ArticleEntity.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

struct ArticlesResponse: Codable {
    let articles: [ArticleEntity]
}

// MARK: - Article
struct ArticleEntity: Codable {
    let source: ArticleSource
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let content: String?
    let publishedAt: String?
}

// MARK: - Source
struct ArticleSource: Codable {
    let name: String
}
