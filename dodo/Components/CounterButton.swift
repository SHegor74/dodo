//
//  CustomButton.swift
//  dodo
//
//  Created by Egor Naberezhnov on 14.01.2024.
//

import UIKit

class CounterButton: UIView {
    
    var countLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .lightGray
        label.text = "1"
        label.textColor = .gray
        label.clipsToBounds = true
        label.textAlignment = .center

        return label
    }()
    
    var leftButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("-", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.clipsToBounds = true

        return button
    }()
    
    var rightButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("+", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.clipsToBounds = true

        return button
    }()
    
    var stack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.layer.cornerRadius = 15
        stack.clipsToBounds = true
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(stack)
        stack.addArrangedSubview(leftButton)
        stack.addArrangedSubview(countLabel)
        stack.addArrangedSubview(rightButton)
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false

    }
    
    
    func setupConstraints() {
        
        stack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        leftButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        
        rightButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        
        countLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(40)
        }
        
    }
    
    
}
