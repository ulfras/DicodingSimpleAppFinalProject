//
//  DetailMealPresenter.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

protocol DetailMealPresenterProtocol {
    var detailMealView: DetailMealViewProtocol? { get set }
    var detailMealInteractor: DetailMealInteractorProtocol? { get set }
    var detailMealRouter: DetailMealRouterProtocol? { get set }
    
    func willFetchDetailMeal()
    
    func willGoToMealSourceWebPage(_ mealURL: String)
}

class DetailMealPresenter: DetailMealPresenterProtocol {
    var detailMealView: DetailMealViewProtocol?
    
    var detailMealInteractor: DetailMealInteractorProtocol?
    
    var detailMealRouter: DetailMealRouterProtocol?
    
    var mealDataFromCell: DetailMealListModel?
    
    init(detailMealView: DetailMealViewProtocol, detailMealInteractor: DetailMealInteractorProtocol, detailMealData: DetailMealListModel) {
        self.detailMealView = detailMealView
        self.detailMealInteractor = detailMealInteractor
        self.mealDataFromCell = detailMealData
    }
    
    func willFetchDetailMeal() {
        guard let detailMealData = mealDataFromCell else {
            return
        }
        
        detailMealView?.showMealDataFromCell(detailMealData)
        detailMealInteractor?.fetchDetailMealData(detailMealData.foodID, completionHandler: { result in
            switch result {
            case .success(let detailMealData):
                self.detailMealView?.showDetailMealData(detailMealData)
            case .failure(let error):
                self.detailMealView?.failedToFetchMealData(error.localizedDescription)
            }
        })
    }
    
    func willGoToMealSourceWebPage(_ mealURL: String) {
        detailMealRouter?.goToMealSourceWebPage(mealURL)
    }
}
