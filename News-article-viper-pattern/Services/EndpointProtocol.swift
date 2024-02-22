//
//  EndpointProtocol.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation



enum Endpoint{
    case getNewsSourcesFromCategory(_ category: String)
    case getNewsArticlesFromSource(_ source: String,_ page :Int)
    
    var APIKey: String {
        return "02a3cb426dd540418ef92ad2b7c5fa2f"
    }
    
    var url: URL {
        switch self {
        case let .getNewsSourcesFromCategory(category):
            return .createEndpointURL("top-headlines/sources?category=\(category)&language=en&apiKey=\(APIKey)")
        case let .getNewsArticlesFromSource(source, page):
            return .createEndpointURL("top-headlines?sources=\(source)&page=\(page)&language=en&apiKey=\(APIKey)")
        }
    }
}

extension URL {
    static func createEndpointURL(_ endpoint: String) -> URL {
        URL(string: "https://newsapi.org/v2/\(endpoint)")!
    }
}
