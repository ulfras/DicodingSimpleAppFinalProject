//
//  MealListRouter.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

protocol MealListRouterProtocol{
    
}

class MealListRouter: MealListRouterProtocol {
    
    weak var mealListViewController: UIViewController?
    
    init(mealListViewController: UIViewController) {
        self.mealListViewController = mealListViewController
    }
    
    
}
