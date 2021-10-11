//
//  ViewController.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import UIKit

struct TableViewState {
    var cryptocurrencies: [Cryptocurrency]
}

protocol MainView: AnyObject {
    var tableViewState: TableViewState? { get set }
}

class MainTableViewController: UITableViewController, MainView {
    
    var tableViewState: TableViewState? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var presenter: MainTablePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseID)
        presenter.viewLoaded()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewState?.cryptocurrencies.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == (tableViewState?.cryptocurrencies.count ?? 0) - 1{
            presenter.loadMore()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID, for: indexPath) as! MainTableViewCell
            
        cell.nameLabel.text = tableViewState?.cryptocurrencies[indexPath.row].name
        cell.symbolLabel.text = tableViewState?.cryptocurrencies[indexPath.row].symbol
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellTapped(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension UIImageView {
    func load(url: String) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
