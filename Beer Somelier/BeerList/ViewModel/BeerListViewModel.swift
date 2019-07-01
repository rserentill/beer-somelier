//
//  BeerListViewModel.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 27/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BeerListViewModel {
    
    public let beers: PublishSubject<[Beer]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error: PublishSubject<APIManager.RequestError> = PublishSubject()
    
    private let disposeBag = DisposeBag()
    
    private lazy var beersProvider: BeersProvider = {
        var provider = BeersProvider()
        provider.delegate = self
        return provider
    }()
    
    public func getBeers(pairingWith food: String, order: BeersProvider.Order = .ascending) {
        
        beersProvider.getBeers(for: food, order: order)
    }
}

// MARK: - BeersProviderDelegate

extension BeerListViewModel: BeersProviderDelegate {
    
    func beersProvider(_ provider: BeersProvider, didRetrieveBeers beers: [Beer]) {
        
        self.beers.onNext(beers)
    }
    
    func beersProvider(_ provider: BeersProvider, didFailWithError error: APIManager.RequestError) {
        
        self.error.onNext(error)
    }
}
