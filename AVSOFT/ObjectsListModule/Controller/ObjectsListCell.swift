//
//  ObjectsListCell.swift
//  AVSOFT
//
//  Created by Danya on 05.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsListCell: UITableViewCell {

    // MARK: - Properties
    
    static let reuseID = "ObjectsListCell"
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions

    func configureUI() {
        addSubview(fullNameLabel)
        fullNameLabel.textColor = .darkGray
        fullNameLabel.font = .systemFont(ofSize: 30)
        fullNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
    }
    
}
