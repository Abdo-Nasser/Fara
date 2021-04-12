//
//  HomePresenter.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewControllerProtocol?
    var interactor:  HomeInteractorProtocol
    var router:  HomeRouterProtocol
    var viewModel:  HomeViewModel
    
    init(view:  HomeViewControllerProtocol,
         interactor:  HomeInteractorProtocol,
         router:  HomeRouterProtocol,
         viewModel:  HomeViewModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.viewModel = viewModel
    }
    
    func attach(){
        getListOfUser()
    }
    
    private func getListOfUser(){
        view?.showLoading(true)
        interactor.getListOfUsers { [weak self] result in
            switch result {
            case .success(let data):
                self?.viewModel.listOfUsers = data
                self?.view?.UpdateUI()
            case .failure(let error):
                print("Get List Of user With error: \(error)")
            }
            self?.view?.showLoading(false)
        }
    }
    
    func openUserProfile(user: User){
        router.go(to: .openUserProfile(user: user))
    }
}
