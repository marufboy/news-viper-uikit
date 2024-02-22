//
//  UIImageView+Ext.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import UIKit
extension UIImageView {
    func load(from urlString: String) {
        let cache = NSCache<NSString, UIImage>()
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let data = data,
                      let image = UIImage(data: data) else {
                    return
                }
                
                cache.setObject(image, forKey: cacheKey)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
            
            task.resume()
        }
    }
}
