//
//  UserProfileContract.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import Foundation

//MARK: - VIPER

//MARK: - RouterAction
enum UserProfileRouterAction {
    case back
}

protocol UserProfileRouterProtocol {
    func go(to: UserProfileRouterAction)
}

//MARK: - Presenter
protocol UserProfilePresenterProtocol: class {
    var viewModel: UserProfileViewModel { get set }
    
    func attach()
    func back()
}

//MARK: - Interactor
protocol UserProfileInteractorProtocol: class {
}

//MARK: - ViewProtocol
protocol UserProfileViewControllerProtocol: class {
    var presenter: UserProfilePresenterProtocol? { get set }
}
