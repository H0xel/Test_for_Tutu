//
//  MainTableViewCell.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseID = "cell_id"

    let selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    let logo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupConstraint()
        
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10
        
        selectedBackgroundView = selectedView
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        addSubview(logo)
        addSubview(nameLabel)
        addSubview(symbolLabel)
        
        NSLayoutConstraint.activate([
        
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
        
            symbolLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            symbolLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 20)
        ])
    }
}
