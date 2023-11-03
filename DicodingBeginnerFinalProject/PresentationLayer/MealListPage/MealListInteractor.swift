//
//  MealListInteractor.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import Alamofire

protocol MealListInteractorProtocol {
    var mealListPresenter: MealListPresenterProtocol? { get set }
    
    func fetchMealList(completionHandler: @escaping (Result<MealListSeafoodModel, AFError>) -> Void)
}

class MealListInteractor: MealListInteractorProtocol {
    var mealListPresenter: MealListPresenterProtocol?
    
    func fetchMealList(completionHandler: @escaping (Result<MealListSeafoodModel, AFError>) -> Void) {
        MealDBAPI.seafoodAPI { result in
            completionHandler(result)
        }
    }
}
