//
//  SourceEntity.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

struct SourcesResponse: Codable {
    let sources: [SourceEntity]
}

//MARK: - Source
struct SourceEntity: Codable {
    let id, name, description: String
    let url: String
    let category, language, country: String
}
