//
//  MealListView.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

protocol MealListViewProtocol {
    var mealListPresenter: MealListPresenterProtocol? { get set }
    
    func showMealData(_ mealListData: [MealListEntity])
    
    func failedToFetchMealData(_ errorString: String)
}

class MealListTableViewController: UITableViewController {
    
    var mealListPresenter: MealListPresenterProtocol?
    
    var mealListData: [MealListEntity] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MealListTableViewCell", bundle: nil), forCellReuseIdentifier: "MealListCell")
        mealListPresenter?.willFetchMealList()
    }
}

extension MealListTableViewController: MealListViewProtocol {
    
    func showMealData(_ mealListData: [MealListEntity]) {
        self.mealListData = mealListData
        self.tableView.reloadData()
    }
    
    func failedToFetchMealData(_ errorString: String) {
        let alert = UIAlertController(title: "Error", message: "Failed to fetch meal data: \(errorString)", preferredStyle: .alert)
        
        let retryButton = UIAlertAction(title: "Retry", style: .default) { _ in
            self.mealListPresenter?.willFetchMealList()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(retryButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true)
    }
}

extension MealListTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mealListData.isEmpty {
            return 0
        } else {
            return mealListData.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "MealListCell", for: indexPath)
        
        guard let cell = reusableCell as? MealListTableViewCell else {
            return reusableCell
        }
        
        let populateCellData = mealListData[indexPath.row]
        
        cell.cellImageOutlet.setImageFrom(populateCellData.foodImageURL)
        cell.cellLabelOutlet.text = populateCellData.foodName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
