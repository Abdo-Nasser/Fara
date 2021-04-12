//
//  UserProfilePresenter.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import Foundation

class UserProfilePresenter: UserProfilePresenterProtocol {
    
    var view: UserProfileViewControllerProtocol?
    var interactor:  UserProfileInteractorProtocol
    var router:  UserProfileRouterProtocol
    var viewModel:  UserProfileViewModel
    
    init(view:  UserProfileViewControllerProtocol,
         interactor:  UserProfileInteractorProtocol,
         router:  UserProfileRouterProtocol,
         viewModel:  UserProfileViewModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.viewModel = viewModel
    }
    
    func attach(){
    }
    
    func back(){
        router.go(to: .back)
    }
}
