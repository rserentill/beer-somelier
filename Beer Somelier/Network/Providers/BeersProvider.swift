//
//  BeersProvider.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 27/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import Foundation

protocol BeersProviderDelegate: class {
    
    func beersProvider(_ provider: BeersProvider, didRetrieveBeers beers: [Beer])
    func beersProvider(_ provider: BeersProvider, didFailWithError error: APIManager.RequestError)
}

struct BeersProvider {
    
    enum Order {
        case ascending
        case descending
    }
    
    weak var delegate: BeersProviderDelegate?
    
    func getBeers(for foodTerm: String, order: Order = .ascending) {
        
        APIManager.request(url: "/beers",
                           method: .get,
                           parameters: ["food": foodTerm.replacingOccurrences(of: " ", with: "_")])
        { result in
            
            switch result {
            case .success(let json):
                
                let beers = json.arrayValue.compactMap { Beer(data: try! $0.rawData()) }
                let sorted = order == .ascending ? beers.sorted(by: { $0.abv < $1.abv }) : beers.sorted(by: { $0.abv > $1.abv })
                /*images.sorted(by: { $0.fileID > $1.fileID })*/
                self.delegate?.beersProvider(self, didRetrieveBeers: sorted)
                
            case .failure(let error):
                
                self.delegate?.beersProvider(self, didFailWithError: error)
            }
        }
    }
}
