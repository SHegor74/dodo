import UIKit
import SnapKit

// MARK: - final - Закрываем класс от наследования

final class MenuScreenVC: UIViewController {
    
    let productService = ProductService.init()
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
        tableView.register(MainProductCell.self, forCellReuseIdentifier: MainProductCell.reusedId)

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        fetchProducts()
    }
    
    private func fetchProducts() {
        self.products = productService.fetchProducts()
    }
}

// MARK: - Setup Views n Constraints

extension MenuScreenVC {
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - DataSource

extension MenuScreenVC: UITableViewDataSource {
    
    //Метод датасорса - возвращаем количество ячеек в таблице в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    //Метод датасораса - возвращаем конкретную ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: MainProductCell.reusedId, for: indexPath) as! MainProductCell
            let product = products[indexPath.row]
            cell.update(product)
            cell.onPriceButtonTapped = { product in
                //let detailVC = DetailScreenVC(product)
                //self.present(detailVC, animated: true)
                self.navigateToDetailScreen(product)
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reusedId, for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.update(product)
        cell.onPriceButtonTapped = { product in
            //let detailVC = DetailScreenVC()
            //self.present(detailVC, animated: true)
            self.navigateToDetailScreen(product)
        }
        return cell
    }
}

// MARK: - Delegate

extension MenuScreenVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let product = products[indexPath.row]
        
        navigateToDetailScreen(product)
    }
}

//MARK: - Navigation
extension MenuScreenVC {
    
    func navigateToDetailScreen(_ product: Product) {
        let detailVC = DetailProductVC()
        self.present(detailVC, animated: true)
    }
}
