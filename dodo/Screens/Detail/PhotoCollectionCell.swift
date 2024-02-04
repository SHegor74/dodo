//
//  PhotoCollectionCell.swift
//  dodo
//
//  Created by Egor Naberezhnov on 24.12.2023.
//

import UIKit
import SnapKit

class PhotoCollectionCell: UICollectionViewCell {
    
    static let reusedId = "PhotoCollectionCell"
    
    var photoImageView: UIImageView = {
        let image = UIImageView()
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cucumber")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .blue
        return image
    }()
    
    var nameLabel: UILabel = {
           let label = UILabel()
           label.text = "Маринованные огурчики"
           label.numberOfLines = 2
           label.textAlignment = .center
           
           return label
       }()
       
       var priceLabel: UILabel = {
           let label = UILabel()
           label.text = "79р"
           label.font = UIFont.boldSystemFont(ofSize: 20)
           label.textAlignment = .center
           
           return label
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)

    }
    
    func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.left.right.equalTo(contentView)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.left.right.equalTo(contentView)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.right.equalTo(contentView)
        }
        
    }
}
