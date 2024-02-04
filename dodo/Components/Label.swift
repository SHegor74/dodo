//
//  Label.swift
//  dodo
//
//  Created by Egor Naberezhnov on 17.12.2023.
//

import UIKit

class NameLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.text = "Гавайская"
        self.font = UIFont.boldSystemFont(ofSize: 20)
    }
}

class Label: UILabel {
    
    enum LabelStyle {
        case name
        case desription
    }
    
    init(style: LabelStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .name:
            createNameLabel()
        case .desription:
            createDescriptionLabel()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createNameLabel() {
        self.text = "Гавайская"
        self.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func createDescriptionLabel() {
        self.text = "Тесто, Цыпленок, моцарелла, томатный соус"
        self.textColor = .darkGray
        self.numberOfLines = 0
        self.font = UIFont.boldSystemFont(ofSize: 15)
    }
}
