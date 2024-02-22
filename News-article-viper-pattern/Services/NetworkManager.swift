//
//  NetworkManager.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import Foundation

protocol DataFetch {
    func getSource(endpoint: Endpoint,completion: @escaping (Result<[SourceEntity], NetworkErrorMessage>) -> Void)
    func getArticle(endpoint: Endpoint,completion: @escaping (Result<[ArticleEntity], NetworkErrorMessage>) -> Void)
}

class NetworkManager: DataFetch {
    private let service: NetworkHelperProtocol
    
    init(service: NetworkHelperProtocol) {
        self.service = service
    }
    
    func getSource(endpoint: Endpoint, completion: @escaping (Result<[SourceEntity], NetworkErrorMessage>) -> Void) {
        service.request(endpoint: endpoint) { data, response, error in
            if let _ = error {
                completion(.failure(.badRequest))
                return
            }
            
            //create response
            guard let response = response as? HTTPURLResponse else { return }
            switch response.statusCode {
            case 200:
                if let decode = self.decode(jsonData: SourcesResponse.self, from: data) {
                    print(decode.sources)
                    completion(.success(decode.sources))
                }
            case 400:
                completion(.failure(.badRequest))
            case 401:
                completion(.failure(.unauthorized))
            case 500:
                completion(.failure(.serverError))
            default:
                break
            }
        }
    }
    
    func getArticle(endpoint: Endpoint, completion: @escaping (Result<[ArticleEntity], NetworkErrorMessage>) -> Void) {
        service.request(endpoint: endpoint) { data, response, error in
            if let _ = error {
                completion(.failure(.badRequest))
                return
            }
            
            //create response
            guard let response = response as? HTTPURLResponse else { return }
            switch response.statusCode {
            case 200:
                if let decode = self.decode(jsonData: ArticlesResponse.self, from: data) {
                    completion(.success(decode.articles))
                }
            case 400:
                completion(.failure(.badRequest))
            case 401:
                completion(.failure(.unauthorized))
            case 500:
                completion(.failure(.serverError))
            default:
                break
            }
        }
    }
    
    private func decode<T: Decodable>(jsonData type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let data = data else { return nil }
        
        do {
            let response = try decoder.decode(type, from: data)
            return response
        } catch {
            print(error)
            return nil
        }
    }
}
