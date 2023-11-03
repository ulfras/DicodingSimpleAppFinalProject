//
//  MealListRouter.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

protocol MealListRouterProtocol{
    func goToDetailMealPage(mealData: MealListEntity)
}

class MealListRouter: MealListRouterProtocol {
    
    weak var mealListViewController: UIViewController?
    
    init(mealListViewController: UIViewController) {
        self.mealListViewController = mealListViewController
    }
    
    func goToDetailMealPage(mealData: MealListEntity) {
        let detailMeal = DetailMealBuilder.build(DetailMealListModel(foodID: mealData.foodID, foodName: mealData.foodName, foodImageURL: mealData.foodImageURL))
        mealListViewController?.navigationController?.pushViewController(detailMeal, animated: true)
    }
}
