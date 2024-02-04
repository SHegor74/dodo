//
//  Button.swift
//  dodo
//
//  Created by Egor Naberezhnov on 17.12.2023.
//

import UIKit

class NameButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.setTitle("от 469 руб.", for: .normal)
        self.backgroundColor = .orange.withAlphaComponent(0.1)
        self.layer.cornerRadius = 20
        self.setTitleColor(.brown, for: .normal)
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
}
