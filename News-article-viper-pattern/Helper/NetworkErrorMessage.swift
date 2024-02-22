//
//  NetworkErrorMessage.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

enum NetworkErrorMessage: String, Error {
    case badRequest         = "The request was unacceptable, often due to a missing or misconfigured parameter"
    case unauthorized       = "Your API key was missing from the request, or wasn't correct"
    case serverError        = "Something went wrong on our side."
}
