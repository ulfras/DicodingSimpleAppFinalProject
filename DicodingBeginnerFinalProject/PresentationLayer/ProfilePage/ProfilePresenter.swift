//
//  ProfilePresenter.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//


protocol ProfilePresenterProtocol {
    var profileView: ProfileViewProtocol? { get set }
    var profileInteractor: ProfileInteractorProtocol? { get set }
    var profileRouter: ProfileRouterProtocol? { get set }
}

class ProfilePresenter: ProfilePresenterProtocol {
    var profileView: ProfileViewProtocol?
    
    var profileInteractor: ProfileInteractorProtocol?
    
    var profileRouter: ProfileRouterProtocol?
    
    init(profileView: ProfileViewProtocol, profileInteractor: ProfileInteractorProtocol) {
        self.profileView = profileView
        self.profileInteractor = profileInteractor
    }
}
