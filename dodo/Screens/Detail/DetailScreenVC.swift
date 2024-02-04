//
//  DetailScreenVC.swift
//  dodo
//
//  Created by Egor Naberezhnov on 17.12.2023.
//

import UIKit

class DetailScreenVC: UIViewController {
    
    var product: Product
    init(_ product: Product) {
        self.product = product
        
        //desnated init - parent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        print("->", product)
    }
}
