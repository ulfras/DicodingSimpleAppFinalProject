//
//  DetailMealRouter.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit
import SafariServices

protocol DetailMealRouterProtocol {
    func goToMealSourceWebPage(_ mealURL: String)
}

class DetailMealRouter: DetailMealRouterProtocol {
    
    weak var detailMealViewController: UIViewController?
    
    init(detailMealViewController: UIViewController) {
        self.detailMealViewController = detailMealViewController
    }
    
    func goToMealSourceWebPage(_ mealURL: String) {
        let url = URL(string: mealURL)
        let safariViewController = SFSafariViewController(url: url!)
        detailMealViewController?.present(safariViewController, animated: true)
    }
}
