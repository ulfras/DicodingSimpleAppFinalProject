//
//  MealListBuilder.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

class MealListBuilder {
    
    static var storyBoard: UIStoryboard {
        return UIStoryboard(name: "MealListPage", bundle: Bundle.main)
    }
    
    static func build() -> UIViewController {
        
        let view = storyBoard.instantiateViewController(withIdentifier: "MealListPage") as! MealListTableViewController
        let interactor = MealListInteractor()
        let presenter = MealListPresenter(mealListView: view, mealListInteractor: interactor)
        let router = MealListRouter(mealListViewController: view)
        
        view.mealListPresenter = presenter
        interactor.mealListPresenter = presenter
        presenter.mealListRouter = router
        
        return view
    }
}
