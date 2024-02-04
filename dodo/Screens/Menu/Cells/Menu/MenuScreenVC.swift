//
//  ViewController.swift
//  dodo
//
//  Created by Egor Naberezhnov on 14.10.2023.
//

import UIKit
import SnapKit

final class MenuScreenVC: UIViewController {
    
    let productServices = ProductService.init()
    
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .orange
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reusedId)
        
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        fetchProducts()
    }
    
    private func fetchProducts() {
        products = productServices.fetchProducts()
    }

}

extension MenuScreenVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reusedId, for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.update(product)
        
        return cell
    }
}


extension MenuScreenVC {
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
