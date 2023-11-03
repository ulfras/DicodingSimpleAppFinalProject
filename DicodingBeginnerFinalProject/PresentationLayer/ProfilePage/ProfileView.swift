//
//  ProfileView.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

protocol ProfileViewProtocol {
    var profilePresenter: ProfilePresenterProtocol? { get set }
}

class ProfileViewController: UIViewController {
    
    var profilePresenter: ProfilePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileViewController: ProfileViewProtocol {
    
}
