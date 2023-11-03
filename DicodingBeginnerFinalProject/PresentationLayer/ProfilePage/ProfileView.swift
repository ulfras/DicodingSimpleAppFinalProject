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
    
    @IBOutlet weak var devImageViewOutlet: UIImageView!
    
    var profilePresenter: ProfilePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        devImageViewOutlet.layer.cornerRadius = devImageViewOutlet.frame.size.width / 2
        devImageViewOutlet.layer.borderWidth = 1
        devImageViewOutlet.layer.borderColor = UIColor.dicoding.cgColor
    }
}

extension ProfileViewController: ProfileViewProtocol {
    
}
