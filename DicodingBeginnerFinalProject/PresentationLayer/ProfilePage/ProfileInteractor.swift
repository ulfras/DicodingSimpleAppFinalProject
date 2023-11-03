//
//  ProfileInteractor.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

protocol ProfileInteractorProtocol {
    var profilePresenter: ProfilePresenterProtocol? { get set }
}

class ProfileInteractor: ProfileInteractorProtocol {
    var profilePresenter: ProfilePresenterProtocol?
    
}
