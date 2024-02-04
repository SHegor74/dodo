//
//  DescriptionCell.swift
//  dodo
//
//  Created by Egor Naberezhnov on 28.01.2024.
//

import UIKit

class ImageCell: UITableViewCell {
    
    static var reuseId = "ImageCellId"
    lazy var pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza")
        imageView.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.80 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.80 * width).isActive = true
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImageCell {
    func setupViews() {
        contentView.addSubview(pizzaImageView)
    }
    func setupConstraints() {
        pizzaImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
