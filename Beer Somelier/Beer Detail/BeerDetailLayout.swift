//
//  BeerDetailLayout.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 01/07/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import UIKit

extension BeerDetailViewController {
    
    func setupUI() {
        
        setupBackButton()
        view.addSubview(headerView)
        headerView.addSubview(beerImageView)
        headerView.addSubview(abvLabel)
        headerView.addSubview(nameLabel)
        headerView.addSubview(taglineLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(descriptionView)
        descriptionView.addSubview(descriptionLabel)
        descriptionView.addSubview(foodTitleLabel)
        descriptionView.addSubview(foodTextLabel)
    }
    
    private func setupBackButton() {
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    func styleUI() {
        
        view.backgroundColor = .dark
        styleBackButton()
        styleHeaderView()
        styleBeerImageView()
        styleAbvLabel()
        styleNameLabel()
        styleTaglineLabel()
        styleScrollView()
        styleDescriptionView()
        styleDescriptionLabel()
        styleFoodTitleLabel()
        styleFoodTextLabel()
    }
    
    private func styleBackButton() {
        
        backButton.backgroundColor = .white
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowOpacity = 0.1
        backButton.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        backButton.layer.shadowRadius = 6.0
        backButton.layer.cornerRadius = 15.0
        backButton.setImage(UIImage(named: "backButtonIcon"), for: .normal)
    }
    
    private func styleHeaderView() {
        
        headerView.backgroundColor = .white
    }
    
    private func styleBeerImageView() {
        
        beerImageView.contentMode = .scaleAspectFit
    }
    
    private func styleAbvLabel() {
        
        abvLabel.font = Font.norwester(.regular).of(size: 20.0)
        abvLabel.textColor = .turquoiseBlue
    }
    
    private func styleNameLabel() {
        
        nameLabel.font = Font.norwester(.regular).of(size: 24.0)
        nameLabel.textColor = .black
    }
    
    
    private func styleTaglineLabel() {
        
        taglineLabel.font = Font.system(.regular).of(size: 18.0)
        taglineLabel.textColor = .brownGrey
    }
    
    private func styleScrollView() {
        
        scrollView.bounces = false
    }
    
    private func styleDescriptionView() {
        
        descriptionView.backgroundColor = .black
    }
    
    private func styleDescriptionLabel() {
        
        descriptionLabel.font = Font.system(.regular).of(size: 14.0)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
    }
    
    private func styleFoodTitleLabel() {
        
        foodTitleLabel.font = Font.norwester(.regular).of(size: 14.0)
        foodTitleLabel.textColor = .turquoiseBlue
    }
    
    private func styleFoodTextLabel() {
        
        foodTextLabel.font = Font.system(.regular).of(size: 12.0)
        foodTextLabel.textColor = .white
        foodTextLabel.numberOfLines = 0
    }
    
    func layoutUI() {
        
        layoutBackButton()
        layoutHeaderView()
        layoutBeerImageView()
        layoutAbvLabel()
        layoutNameLabel()
        layoutTaglineLabel()
        layoutScrollView()
        layoutDescriptionView()
        layoutDescriptionLabel()
        layoutFoodTitleLabel()
        layoutFoodTextLabel()
    }
    
    private func layoutBackButton() {
        
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(30.0)
            make.top.equalTo(view.layoutMarginsGuide.snp.top).offset(12.0)
            make.leading.equalToSuperview().offset(16.0)
        }
    }
    
    private func layoutHeaderView() {
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.height / 3.5)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func layoutBeerImageView() {
        
        beerImageView.snp.makeConstraints { make in
            make.height.equalTo((UIScreen.main.bounds.height / 3.5) - 48)
            make.width.equalTo(beerImageView.snp.height).multipliedBy(0.263)
            make.bottom.equalTo(headerView.snp.top).offset(52.0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func layoutAbvLabel() {
        
        abvLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.0)
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalTo(beerImageView.snp.leading).offset(16.0)
        }
    }
    
    private func layoutNameLabel() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(abvLabel.snp.bottom).offset(18.0)
            make.leading.equalTo(abvLabel)
            make.trailing.equalToSuperview().offset(-16.0)
        }
    }
    
    private func layoutTaglineLabel() {
        
        taglineLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8.0)
            make.leading.equalTo(nameLabel)
            make.trailing.equalToSuperview().offset(-16.0)
            make.bottom.equalToSuperview().offset(-20.0)
        }
    }
    
    private func layoutScrollView() {
        
        scrollView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    private func layoutDescriptionView() {
        descriptionView.snp.makeConstraints { make in
            make.top.trailing.bottom.leading.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
            make.width.equalToSuperview()
        }
    }
    
    private func layoutDescriptionLabel() {
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(42.0)
            make.leading.equalToSuperview().offset(42.0)
            make.trailing.equalToSuperview().offset(-42.0)
            
            let line = UIView()
            line.backgroundColor = .brownGrey
            descriptionView.addSubview(line)
            line.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.height.equalTo(1.0)
                make.width.equalTo(60.0)
                make.top.equalTo(descriptionLabel.snp.bottom).offset(20.0)
            }
        }
    }
    
    private func layoutFoodTitleLabel() {
        
        foodTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(41.0)
            make.leading.trailing.equalTo(descriptionLabel)
        }
    }
    
    private func layoutFoodTextLabel() {
        
        foodTextLabel.snp.makeConstraints { make in
            make.top.equalTo(foodTitleLabel.snp.bottom).offset(10.0)
            make.leading.trailing.equalTo(descriptionLabel)
            make.bottom.equalToSuperview()
        }
    }
}
