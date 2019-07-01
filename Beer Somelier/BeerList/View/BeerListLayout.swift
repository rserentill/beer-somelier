//
//  BeerListLayout.swift
//
//
//  Created by Roger Serentill Gené on 27/06/2019.
//

import UIKit
import SnapKit

extension BeerListViewController {
    
    struct Cells {
        static let beerIdentifier = "BeerCell"
    }
    
    // MARK: - Setup
    
    func setupUI() {
        
        view.addSubview(headerView)
        setupSearchTextField()
        setupSortButton()
        setupTableView()
    }
    
    private func setupSearchTextField() {
        
        headerView.addSubview(searchBar)
    }
    
    private func setupSortButton() {
        
        view.addSubview(sortButton)
        sortButton.setTitle("ABV: Asc", for: .normal)
        sortButton.setTitleColor(.turquoiseBlue, for: .normal)
        sortButton.titleLabel?.font = Font.norwester(.regular).of(size: 10.0)
        sortButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12.0, bottom: 0, right: 12.0)
        sortButton.addTarget(self, action: #selector(toggleSort), for: .touchUpInside)
    }
    
    private func setupTableView() {
        
        view.insertSubview(tableView, belowSubview: sortButton)
        tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0, bottom: 0, right: 0)
        tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: Cells.beerIdentifier)
    }
    
    // MARK: - Style
    
    func styleUI() {
        
        view.backgroundColor = .dark
        styleHeaderView()
        styleSearchTextField()
        styleSortButton()
        styleTableView()
    }
    
    private func styleHeaderView() {
        
        headerView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    }
    
    private func styleSearchTextField() {
        
        searchBar.barTintColor = .clear
        searchBar.backgroundColor = .clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        let searchTextField = searchBar.value(forKey: "searchField") as? UITextField
        searchTextField?.font = Font.norwester(.regular).of(size: 18.0)
        searchTextField?.textColor = .dark
    }
    
    private func styleSortButton() {
        
        sortButton.backgroundColor = .white
        sortButton.layer.cornerRadius = 14.0
        sortButton.layer.shadowColor = UIColor.black.cgColor
        sortButton.layer.shadowOpacity = 0.16
        sortButton.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        sortButton.layer.shadowRadius = 6.0
    }
    
    private func styleTableView() {
        
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 125.0
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Layout
    
    func layoutUI() {
        
        layoutHeaderView()
        layoutSearchTextField()
        layoutSortButton()
        layoutTableView()
    }
    
    private func layoutHeaderView() {
        
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .white
        headerView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1.0)
            
            make.bottom.equalToSuperview()
        }
    }
    
    private func layoutSearchTextField() {
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.top)
            make.top.trailing.bottom.leading.equalToSuperview()
        }
    }
    
    private func layoutSortButton() {
        
        sortButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(16.0)
            make.height.equalTo(28.0)
        }
    }
    
    private func layoutTableView() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.trailing.bottom.leading.equalToSuperview()
        }
    }
}
