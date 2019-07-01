//
//  BeerTableViewCellLayout.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 27/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import Foundation

extension BeerTableViewCell {
    
    // MARK: - Setup
    
    func setupUI() {
        
        contentView.addSubview(containerView)
        containerView.addSubview(mainInfoView)
        containerView.addSubview(beerImageview)
        mainInfoView.addSubview(nameLabel)
        mainInfoView.addSubview(taglineLabel)
        mainInfoView.addSubview(abvLabel)
        containerView.insertSubview(descriptionView, belowSubview: mainInfoView)
        descriptionView.addSubview(descriptionLabel)
    }
    
    // MARK: - Style
    
    func styleUI() {
        
        backgroundColor = .clear
        selectionStyle = .none
        styleMainInfoView()
        styleBeerImageView()
        styleNameLabel()
        styleTaglineLabel()
        styleAbvLabel()
        styleDescriptionView()
        styleDecsriptionLabel()
    }
    
    private func styleMainInfoView() {
        
        mainInfoView.backgroundColor = .white
        mainInfoView.layer.cornerRadius = 4.0
    }
    
    private func styleBeerImageView() {
        
        beerImageview.contentMode = .scaleAspectFit
    }
    
    private func styleNameLabel() {
        
        nameLabel.font = Font.norwester(.regular).of(size: 18.0)
        nameLabel.textColor = .black
    }
    
    private func styleTaglineLabel() {
        
        taglineLabel.font = Font.system(.regular).of(size: 12.0)
        taglineLabel.textColor = .brownGrey
    }
    
    private func styleAbvLabel() {
        
        abvLabel.font = Font.norwester(.regular).of(size: 12.0)
        abvLabel.textColor = .turquoiseBlue
    }
    
    private func styleDescriptionView() {
        
        descriptionView.backgroundColor = .black
        descriptionView.layer.cornerRadius = 4.0
    }
    
    private func styleDecsriptionLabel() {
        
        descriptionLabel.font = Font.system(.regular).of(size: 12.0)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 2
    }
    
    // MARK: - Layout
    
    func layoutUI() {
        
        layoutContainerView()
        layoutMainInfoView()
        layoutBeerImageView()
        layoutNameLabel()
        layoutTaglineLabel()
        layoutAbvLabel()
        layoutDescriptionView()
        layoutDescriptionLabel()
    }
    
    private func layoutContainerView() {
        
        containerView.snp.makeConstraints { make in
            make.top.trailing.bottom.leading.equalToSuperview()
        }
    }
    
    private func layoutMainInfoView() {
        
        mainInfoView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview().offset(-16.0)
        }
    }
    
    private func layoutBeerImageView() {
        
        beerImageview.snp.makeConstraints { make in
            make.trailing.equalTo(mainInfoView.snp.trailing).offset(-16.0)
            make.top.equalTo(mainInfoView.snp.top).offset(-20.0)
            make.bottom.equalTo(mainInfoView.snp.bottom).offset(24.0)
            make.width.equalTo(beerImageview.snp.height).multipliedBy(0.263)
            make.height.lessThanOrEqualTo(114.0)
        }
    }
    
    private func layoutNameLabel() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.0)
            make.trailing.equalTo(beerImageview.snp.leading).offset(-14.0)
            make.leading.equalToSuperview().offset(14.0)
        }
    }
    
    private func layoutTaglineLabel() {
        
        taglineLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(4.0)
        }
    }
    
    private func layoutAbvLabel() {
        
        abvLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(taglineLabel)
            make.top.equalTo(taglineLabel.snp.bottom).offset(4.0)
            make.bottom.equalToSuperview().offset(-8.0)
        }
    }
    
    private func layoutDescriptionView() {
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(mainInfoView.snp.bottom).offset(-4.0)
            make.leading.equalTo(mainInfoView.snp.leading).offset(6.0)
            make.trailing.equalTo(mainInfoView.snp.trailing).offset(-6.0)
            make.bottom.equalToSuperview().offset(-16.0)
        }
    }
    
    private func layoutDescriptionLabel() {
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(12.0)
            make.trailing.equalTo(beerImageview.snp.leading).offset(-12.0)
            make.bottom.equalToSuperview().offset(-8.0)
        }
    }
}
