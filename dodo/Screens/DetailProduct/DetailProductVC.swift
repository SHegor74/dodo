//
//  DetailProductVC.swift
//  dodo
//
//  Created by Egor Naberezhnov on 28.01.2024.
//

import UIKit

enum DetailRow: Int, CaseIterable {
    case photo = 0
    case description = 1
    //case portion
    //case characteristics
}

class DetailProductVC: UIViewController {
    
    //let cellId = "cellId"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseId)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.reuseId)
        return tableView
    }()
    
    lazy var orderButton = Button(style: .normal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        //view.addSubview(orderButton)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
    }
    
}

extension DetailProductVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("->", DetailRow.allCases.count)
        return DetailRow.allCases.count
        
        //return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let detailRow = DetailRow(rawValue: indexPath.row) {
            
            switch detailRow {
                
            case .photo:
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseId, for: indexPath) as! ImageCell
                return cell
            
            case .description:
                let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.reuseId, for: indexPath) as! DescriptionCell
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    
}

extension DetailProductVC: UITableViewDelegate {
    
}
