//
//  TabBarController.swift
//  dodo
//
//  Created by Egor Naberezhnov on 24.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    let menuScreenVC: MenuScreenVC = {
        let controller = MenuScreenVC()
        let tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        controller.tabBarItem = tabBarItem
        return controller
    }()
    
    let ingredientsScreenVC: IngredientsScreenVC = {
        let controller = IngredientsScreenVC()
        let tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "folder.badge.person.crop"), selectedImage: UIImage(systemName: "folder.fill.badge.person.crop"))
        controller.tabBarItem = tabBarItem
        return controller
    }()
    
    let basketScreenVC: BasketScreenVC = {
        let controller = BasketScreenVC()
        let tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        controller.tabBarItem = tabBarItem
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.stackedLayoutAppearance.normal.iconColor = .lightGray
        apperance.stackedLayoutAppearance.selected.iconColor = .lightGray
        
        tabBar.configureMaterialBackground()
        tabBar.standardAppearance = apperance
        tabBar.scrollEdgeAppearance = apperance
        viewControllers = [menuScreenVC, ingredientsScreenVC, basketScreenVC]
    }
}

public extension UITabBar {
    func configureMaterialBackground() {
        // Make tabBar fully tranparent
        isTranslucent = true
        backgroundImage = UIImage()
        shadowImage = UIImage() // no separator
        barTintColor = .clear
        layer.backgroundColor = UIColor.clear.cgColor
    
        // Apply icon colors
        tintColor = .green
        unselectedItemTintColor = .white
    
        // Add material blur
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(blurView, at: 0)
    }
}
