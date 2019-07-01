//
//  Beer.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 27/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import Foundation

struct Beer: Codable {
    
    var id: Int!
    var name: String!
    var tagline: String!
    var description: String!
    var abv: Float!
    var imageUrl: URL? { return URL(string: imageUrlString ?? "") }
    var foods: [String]!
    private var imageUrlString: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, tagline, description, abv
        case imageUrlString = "image_url"
        case foods = "food_pairing"
    }
}

extension Beer {
    
    init?(data: Data) {
        
        do {
            self = try JSONDecoder().decode(Beer.self, from: data)
        }
        catch {
            print("JSON Decode filed: \(error.localizedDescription)")
            return nil
        }
    }
}
