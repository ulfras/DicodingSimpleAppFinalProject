//
//  ProfileRouter.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

protocol ProfileRouterProtocol {
    
}

class ProfileRouter: ProfileRouterProtocol {
    
    weak var profileViewController: UIViewController?
    
    init(profileViewController: UIViewController) {
        self.profileViewController = profileViewController
    }
}
