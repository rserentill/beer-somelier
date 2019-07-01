//
//  BeerTableViewCell.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 27/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    // MARK: - Layout elements
    
    let containerView = UIView()
    let mainInfoView = UIView()
    let descriptionView = UIView()
    let beerImageview = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    let abvLabel = UILabel()
    let descriptionLabel = UILabel()

    // MARK: - View lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        styleUI()
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Display data
    
    func displayData(with beer: Beer) {
        
        nameLabel.text = beer.name
        taglineLabel.text = beer.tagline
        abvLabel.text = "ABV: \(beer.abv ?? 0.0)"
        descriptionLabel.text = beer.description
        beerImageview.loadImage(from: beer.imageUrl)
    }
}
