//
//  DescriptionCell.swift
//  dodo
//
//  Created by Egor Naberezhnov on 28.01.2024.
//

import UIKit

class DescriptionCell: UITableViewCell {
    
    static var reuseId = "DescriptionCellId"
    var pizzaDescriptionLabel = Label(style: .desription)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        pizzaDescriptionLabel.text = "Pizza"
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionCell {
    func setupViews() {
        contentView.addSubview(pizzaDescriptionLabel)
    }
    func setupConstraints() {
        pizzaDescriptionLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(16)
        }
    }
}
