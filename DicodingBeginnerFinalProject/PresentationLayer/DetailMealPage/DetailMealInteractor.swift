//
//  DetailMealInteractor.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import Alamofire

protocol DetailMealInteractorProtocol {
    var detailMealPresenter: DetailMealPresenterProtocol? { get set }
    
    func fetchDetailMealData(_ mealID: String, completionHandler: @escaping (Result<MealListSeafoodDetailModel, AFError>) -> Void)
}

class DetailMealInteractor: DetailMealInteractorProtocol {
    var detailMealPresenter: DetailMealPresenterProtocol?
    
    func fetchDetailMealData(_ mealID: String, completionHandler: @escaping (Result<MealListSeafoodDetailModel, AFError>) -> Void) {
        MealDBAPI.seafoodDetailAPI(mealID) { result in
            completionHandler(result)
        }
    }
}
