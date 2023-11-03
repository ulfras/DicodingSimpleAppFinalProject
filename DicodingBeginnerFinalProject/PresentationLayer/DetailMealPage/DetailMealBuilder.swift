//
//  DetailMealBuilder.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

class DetailMealBuilder {
    
    static var storyBoard: UIStoryboard {
        return UIStoryboard(name: "DetailMealPage", bundle: Bundle.main)
    }
    
    static func build(_ detailMealData: DetailMealListModel) -> UIViewController {
        
        let view = storyBoard.instantiateViewController(withIdentifier: "DetailMealPage") as! DetailMealViewController
        let interactor = DetailMealInteractor()
        let presenter = DetailMealPresenter(detailMealView: view, detailMealInteractor: interactor, detailMealData: detailMealData)
        let router = DetailMealRouter(detailMealViewController: view)
        
        view.detailMealPresenter = presenter
        interactor.detailMealPresenter = presenter
        presenter.detailMealRouter = router
        
        return view
    }
}
