//
//  CategoryEntity.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

struct CategoryEntity {
    let name: String?
    let symbol: String
}

enum Categories: String {
    case business = "Business"
    case entertainment = "Entertainment"
    case general = "General"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
    
    var symbol: String {
        switch self {
        case .business: return "dollarsign.circle"
        case .entertainment: return "burst.fill"
        case .general: return "newspaper.fill"
        case .health: return "heart.fill"
        case .science: return "atom"
        case .sports: return "sportscourt.fill"
        case .technology: return "network"
        }
    }
}
