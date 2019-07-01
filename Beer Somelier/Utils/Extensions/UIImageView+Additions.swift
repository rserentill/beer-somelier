//
//  UIImageView+Additions.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 30/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImage(from url: URL?) {
        guard let imageURL = url else { return }
        
        let cache =  URLCache.shared
        let request = URLRequest(url: imageURL)
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.transition(to: image)
                }
            } else {
                URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            self.transition(to: image)
                        }
                    }
                }).resume()
            }
        }
    }
    
    private func transition(to image: UIImage?) {
        UIView.transition(with: self, duration: 0.3,
                          options: [.transitionCrossDissolve],
                          animations: {
                            self.image = image
        },
                          completion: nil)
    }
}
