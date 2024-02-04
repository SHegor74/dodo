//
//  File.swift
//  dodo
//
//  Created by Egor Naberezhnov on 22.10.2023.
//

import Foundation

class ProductService {
    
    let products: [Product] = [
        Product(name: "Гавайская", detail: "Тесто, Cыр, Буженина", price: 590, image: "hawaii"),
        Product(name: "Маргарита", detail: "Тесто, Cыр, Колбаска", price: 650, image: "margarita"),
        Product(name: "Пепперони", detail: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni")
    ]
    
    func fetchProducts() -> [Product] {
        return products
    }
}
