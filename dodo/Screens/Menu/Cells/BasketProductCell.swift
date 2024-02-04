//
//  BucketProductCell.swift
//  dodo
//
//  Created by Egor Naberezhnov on 14.01.2024.
//

import UIKit

class BasketProductCell: UITableViewCell {
    
    static let reusedId = "BusketCell"
    
    var product: Product?
    
    var counterButton = CounterButton()
    
    var verticalStackView: UIStackView = {
        var stack = UIStackView.init()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 15
        
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        
        return stack
    }()
    
    var horisontalStackView: UIStackView = {
        var stack = UIStackView.init()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 15
        
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        
        return stack
    }()
    
    var nameLabel = Label(style: .name)
    
    var priceLabel = Label(style: .name)
    
    var detailLabel = Label(style: .desription)

    var productImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "pizza")
        imageView.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
    
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
    
    
    func update(_ product: Product) {
        self.product = product
        nameLabel.text = product.name
        detailLabel.text = product.detail
        productImageView.image = UIImage(named: product.image)
        priceLabel.text = "\(product.price) руб."
    }
    
    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(horisontalStackView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(detailLabel)
        horisontalStackView.addArrangedSubview(priceLabel)
        horisontalStackView.addArrangedSubview(counterButton)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.left.top.equalTo(contentView).offset(16)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.right.equalTo(contentView).inset(16)
            make.left.equalTo(productImageView.snp.right).offset(16)
        }
        
        horisontalStackView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(contentView).inset(16)
            make.top.equalTo(productImageView.snp.bottom).inset(10)
        }
        

        

    }
}

