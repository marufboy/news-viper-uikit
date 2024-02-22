//
//  NetworkHelper.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

protocol NetworkHelperProtocol {
    func request(endpoint: Endpoint, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class NetworkHelper: NetworkHelperProtocol {
    func request(endpoint: Endpoint,completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = createTask(url: endpoint.url, completion: completion)
        task.resume()
    }
    
    private func createTask(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        return URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async { completion(data, response, error) }
        }
    }
}
