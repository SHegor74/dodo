//
//  BasketScreenVC.swift
//  dodo
//
//  Created by Egor Naberezhnov on 14.01.2024.
//

import UIKit

class BasketScreenVC: UIViewController {
    
    var productsService = ProductService()
    
//    var cartLabel = Label(style: .name)
//    var sumLabel = Label(style: .name)
//    
//    var orderButton: UIButton = {
//        var button = UIButton()
//        button.setTitle("Оформить заказ", for: .normal)
//        button.backgroundColor = .orange.withAlphaComponent(0.1)
//        button.layer.cornerRadius = 20
//        button.setTitleColor(.brown, for: .normal)
//        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
//        
//        button.addTarget(nil, action: #selector(priceButtonTapped), for: .touchUpInside)
//        
//        return button
//    }()

    
    lazy var tableView: UITableView = {
       var tableView = UITableView()
        tableView.backgroundColor = .orange
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasketProductCell.self, forCellReuseIdentifier: BasketProductCell.reusedId)

        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    
}


extension BasketScreenVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsService.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketProductCell.reusedId, for: indexPath) as! BasketProductCell
        
        let product = productsService.products[indexPath.row]
        
        cell.update(product)
        
        return cell
    }
    
    
}


