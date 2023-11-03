//
//  DetailMealView.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit
import youtube_ios_player_helper

protocol DetailMealViewProtocol {
    var detailMealPresenter: DetailMealPresenterProtocol? { get set }
    
    func showMealDataFromCell(_ mealData: DetailMealListModel)
    
    func showDetailMealData(_ detailMealData: MealListSeafoodDetailModel)
    
    func failedToFetchMealData(_ errorString: String)
}

class DetailMealViewController: UIViewController {
    
    @IBOutlet weak var youtubeViewOutlet: YTPlayerView!
    @IBOutlet weak var mealImageViewOutlet: UIImageView!
    @IBOutlet weak var foodCategoryLabelOutlet: UILabel!
    @IBOutlet weak var foodOriginLabelOutlet: UILabel!
    @IBOutlet weak var mealInstructionTextViewOutlet: UITextView!
    @IBOutlet weak var mealSourceButtonOutlet: UIButton!
    
    var detailMealPresenter: DetailMealPresenterProtocol?
    var mealSourceWebPage: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailMealPresenter?.willFetchDetailMeal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        mealImageViewOutlet.layer.cornerRadius = 16
        
        mealSourceButtonOutlet.layer.cornerRadius = 10
        mealSourceButtonOutlet.layer.borderWidth = 1
        mealSourceButtonOutlet.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    
    @IBAction func mealSourceTapIn(_ sender: Any) {
        guard let mealSourceWebPage = mealSourceWebPage else { return }
        detailMealPresenter?.willGoToMealSourceWebPage(mealSourceWebPage)
    }
}

extension DetailMealViewController: DetailMealViewProtocol {
    func showMealDataFromCell(_ mealData: DetailMealListModel) {
        self.title = mealData.foodName
        mealImageViewOutlet.setImageFrom(mealData.foodImageURL)
    }
    
    func showDetailMealData(_ detailMealData: MealListSeafoodDetailModel) {
        
        guard let youtubeID = detailMealData.meals?.first?.strYoutube?.youtubeID else { return }
        youtubeViewOutlet.load(withVideoId: youtubeID)
        
        foodCategoryLabelOutlet.text = detailMealData.meals?.first?.strCategory
        foodOriginLabelOutlet.text = detailMealData.meals?.first?.strArea
        mealInstructionTextViewOutlet.text = "Instruction : \n\n\(detailMealData.meals?.first?.strInstructions ?? "")"
        mealSourceWebPage = detailMealData.meals?.first?.strSource
    }
    
    func failedToFetchMealData(_ errorString: String) {
        let alert = UIAlertController(title: "Error", message: "Failed to fetch detail meal data: \(errorString)", preferredStyle: .alert)
        
        let retryButton = UIAlertAction(title: "Retry", style: .default) { _ in
            self.detailMealPresenter?.willFetchDetailMeal()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(retryButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true)
    }
}
