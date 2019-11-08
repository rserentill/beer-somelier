//
//  BeerListViewController.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 27/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BeerListViewController: UIViewController {
    
    // MARK: Layout elements
    
    let headerView = UIView()
    let sortButton = UIButton()
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    // MARK: Dependencies
    
    private var beersViewModel = BeerListViewModel()
    private let disposeBag = DisposeBag()
    private var order: BeersProvider.Order = .ascending {
        didSet {
            sortButton.setTitle("ABV: \(order == .ascending ? "Asc" : "Desc")", for: .normal)
        }
    }

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        setupUI()
        styleUI()
        layoutUI()
        
        // Data
        bindSearchTerm()
        bindErrors()
        setupTableDataSourceBindings()
    }
    
    // MARK: Actions
    
    @objc func toggleSort() {
        
        order = (order == .ascending) ? .descending : .ascending
        guard let text = searchBar.text, !text.isEmpty else { return }
        beersViewModel.getBeers(pairingWith: text, order: order)
    }

    // MARK: Helpers
    
    private func bindSearchTerm() {
        
        searchBar
            .rx
            .searchButtonClicked
            .asObservable()
            .subscribe(onNext: { [unowned self] in
                guard let text = self.searchBar.text else { return }
                self.beersViewModel.getBeers(pairingWith: text, order: self.order)
                self.searchBar.endEditing(true)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindErrors() {
        
        beersViewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupTableDataSourceBindings() {
        
        beersViewModel.beers
            .bind(to: tableView.rx.items(cellIdentifier: Cells.beerIdentifier, cellType: BeerTableViewCell.self)) { row, beer, cell in
                cell.displayData(with: beer)
            }
            .disposed(by: disposeBag)
        
        tableView
            .rx
            .willDisplayCell
            .subscribe(onNext: { cell, indexPath in
            
                cell.alpha = 0.0
                let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
                cell.layer.transform = transform
                
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [.curveEaseOut, .allowUserInteraction], animations: {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DIdentity
                }, completion: nil)
                
            })
            .disposed(by: disposeBag)
        
        tableView
            .rx
            .modelSelected(Beer.self)
            .subscribe(onNext: { [weak self] beer in
                let detailViewController = BeerDetailViewController(beer: beer)
                self?.navigationController?.pushViewController(detailViewController, animated: true)
            }).disposed(by: disposeBag)
    }
}
