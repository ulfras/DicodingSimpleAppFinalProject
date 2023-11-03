//
//  TabBarView.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mealListViewController = setupMealListPage()
        
        let profileViewController = setupProfilePage()
        
        self.viewControllers = [mealListViewController, profileViewController]
    }
}

extension TabBarViewController {
    
    private func setupMealListPage() -> UINavigationController {
        
        let mealListPage = MealListBuilder.build()
        
        let listIcon = UIImage(systemName: "list.bullet")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemGray)
        let selectedListImage = UIImage(systemName: "list.bullet")?.withRenderingMode(.alwaysOriginal).withTintColor(.dicoding)
        
        let mealListNavigationController = UINavigationController(rootViewController: mealListPage)
        
        mealListNavigationController.tabBarItem = UITabBarItem(title: "Meal List", image: listIcon, selectedImage: selectedListImage)
        mealListNavigationController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.systemGray], for: .normal)
        mealListNavigationController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        
        mealListNavigationController.navigationBar.tintColor = .black
        
        return mealListNavigationController
    }
    
    private func setupProfilePage() -> UINavigationController {
        
        let profilePage = ProfileBuilder.build()
        
        let profileIcon = UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemGray)
        let selectedProfileIcon = UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.dicoding)
        
        let profileNavigationController = UINavigationController(rootViewController: profilePage)
        
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: profileIcon, selectedImage: selectedProfileIcon)
        profileNavigationController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.systemGray], for: .normal)
        profileNavigationController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        
        profileNavigationController.navigationBar.tintColor = .black
        
        return profileNavigationController
    }
}
