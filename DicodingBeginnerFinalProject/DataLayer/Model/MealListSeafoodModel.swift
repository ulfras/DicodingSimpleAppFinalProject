//
//  MealListSeafoodModel.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

struct MealListSeafoodModel: Decodable {
    let meals: [Seafood]?

    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

struct Seafood: Decodable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?

    enum CodingKeys: String, CodingKey {
        case strMeal = "strMeal"
        case strMealThumb = "strMealThumb"
        case idMeal = "idMeal"
    }
}
