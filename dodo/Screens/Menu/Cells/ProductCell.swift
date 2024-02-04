//
//  ProductCell.swift
//  dodo
//
//  Created by Egor Naberezhnov on 14.10.2023.
//

import UIKit


class ProductCell: UITableViewCell {
    var onPriceButtonTapped: ((Product) -> ())?
    static let reusedId = "ProductCell"
    
    var product: Product?
    
    var verticalStackView: UIStackView = {
        var stack = UIStackView.init()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 15
        
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        
        return stack
    }()
    
    var nameLabel = Label(style: .name)
    
    var detailLabel = Label(style: .desription)
//    var detailLabel: UILabel = {
//        var label = UILabel()
//        label.text = "Тесто, Цыпленок, моцарелла, томатный соус"
//        label.textColor = .darkGray
//        label.numberOfLines = 0
//        label.font = UIFont.boldSystemFont(ofSize: 15)
//        
//        return label
//    }()
    
    var priceButton: UIButton = {
        var button = UIButton()
        button.setTitle("от 469 руб.", for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.1)
        button.layer.cornerRadius = 20
        button.setTitleColor(.brown, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        button.addTarget(nil, action: #selector(priceButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    //var priceButton = Button(style: .normal)
    
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
    
    func update(_ product: Product) {
        self.product = product
        nameLabel.text = product.name
        detailLabel.text = product.detail
        priceButton.setTitle("\(product.price) руб.", for: .normal)
        productImageView.image = UIImage(named: product.image)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCell {
    @objc func priceButtonTapped() {
        if let item = product {
            onPriceButtonTapped?(item)
        }
    }
}

extension ProductCell {
    
    struct Layout {
        static let offset = 16
    }
    
    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(detailLabel)
        verticalStackView.addArrangedSubview(priceButton)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(contentView).inset(16)
            make.left.equalTo(productImageView.snp.right).offset(16)
        }
    }
    
}
