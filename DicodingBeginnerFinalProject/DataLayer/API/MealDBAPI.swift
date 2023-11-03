//
//  MealDBAPI.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import Alamofire

class MealDBAPI {
    
    static func seafoodAPI(completionHandler: @escaping (Result<MealListSeafoodModel, AFError>) -> Void) {
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"
        AF.request(url).responseDecodable(of: MealListSeafoodModel.self) { response in
            completionHandler(response.result)
        }
    }
    
    static func seafoodDetailAPI(_ mealID: String, completionHandler: @escaping (Result<MealListSeafoodDetailModel, AFError>) -> Void) {
        let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        AF.request(url).responseDecodable(of: MealListSeafoodDetailModel.self) { response in
            completionHandler(response.result)
        }
    }
}
