//
//  BeerDetailViewController.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 30/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    let backButton = UIButton()
    let headerView = UIView()
    let beerImageView = UIImageView()
    let abvLabel = UILabel()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    let scrollView = UIScrollView()
    let descriptionView = UIView()
    let descriptionLabel = UILabel()
    let foodTitleLabel = UILabel()
    let foodTextLabel = UILabel()
    
    private let beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        styleUI()
        layoutUI()
        
        displayData()
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func displayData() {
        
        beerImageView.loadImage(from: beer.imageUrl)
        abvLabel.text = "ABV: \(beer.abv ?? 0.0)"
        nameLabel.text = beer.name
        taglineLabel.text = beer.tagline
        descriptionLabel.text = beer.description
        descriptionLabel.setLineSpacing(lineSpacing: 12.0)
        foodTitleLabel.text = "Pair this beer with:"
        var foods = ""
        for food in beer.foods {
            foods += food + "\n"
        }
        foodTextLabel.text = foods
        foodTextLabel.setLineSpacing(lineSpacing: 10.0)
        
    }
}
