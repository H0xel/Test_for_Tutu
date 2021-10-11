//
//  DetailViewController.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import UIKit

protocol DetailView: AnyObject {
    func display(currencyTitle: String, currencyPrice: String, chartImageUrl: String)
}

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenter!
    
    lazy private var detailLoadView = DetailLoadView()
    

    
    override func loadView() {
        view = detailLoadView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewLoaded()
    }
}

extension DetailViewController: DetailView {
    func display(currencyTitle: String, currencyPrice: String, chartImageUrl: String) {
        detailLoadView.currencyNameLabel.text = currencyTitle
        detailLoadView.currencyPriceLabel.text = currencyPrice
//        let url = URL(string: "https://3commas.io/ru\(chartImageUrl)")
//        loadView.currencyChart.kf.setImage(with: url)
    }
}
