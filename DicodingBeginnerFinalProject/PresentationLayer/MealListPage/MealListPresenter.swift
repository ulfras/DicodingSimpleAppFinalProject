//
//  MealListPresenter.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

protocol MealListPresenterProtocol {
    var mealListView: MealListViewProtocol? { get set }
    var mealListInteractor: MealListInteractorProtocol? { get set }
    var mealListRouter: MealListRouterProtocol? { get set }
    
    func willFetchMealList()
    
    func willGoToDetailMeal(mealData: MealListEntity)
}

class MealListPresenter: MealListPresenterProtocol {
    var mealListView: MealListViewProtocol?
    
    var mealListInteractor: MealListInteractorProtocol?
    
    var mealListRouter: MealListRouterProtocol?
    
    init(mealListView: MealListViewProtocol, mealListInteractor: MealListInteractorProtocol) {
        self.mealListView = mealListView
        self.mealListInteractor = mealListInteractor
    }
    
    func willFetchMealList() {
        mealListInteractor?.fetchMealList { result in
            switch result {
            case .success(let mealData):
                
                var mealListData: [MealListEntity] = []
                
                for mealDatum in mealData.meals! {
                    mealListData.append(MealListEntity(foodID: mealDatum.idMeal!, foodName: mealDatum.strMeal!, foodImageURL: mealDatum.strMealThumb!))
                }
                
                self.mealListView?.showMealData(mealListData)
            case .failure(let error):
                self.mealListView?.failedToFetchMealData(error.localizedDescription)
            }
        }
    }
    
    func willGoToDetailMeal(mealData: MealListEntity) {
        mealListRouter?.goToDetailMealPage(mealData: mealData)
    }
}
