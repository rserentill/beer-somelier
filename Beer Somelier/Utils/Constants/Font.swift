//
//  Font.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 30/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import Foundation
import UIKit

enum Font {
    
    case norwester(Norwester)
    case system(SFDisplay)
    
    enum Norwester: String {
        case regular = "Norwester-Regular"
    }
    
    enum SFDisplay {
        case light
        case regular
        case bold
    }
    
    func of(size: CGFloat) -> UIFont {
        switch self {
        case .norwester(let name):
            return UIFont(name: name.rawValue, size: size)!
        case .system(let weight):
            
            let weightsDict: [SFDisplay: UIFont.Weight] =  [
                .light: .light,
                .regular: .regular,
                .bold: .bold
            ]
            return UIFont.systemFont(ofSize: size, weight: weightsDict[weight] ?? .regular)
        }
    }
}
