//
//  HomeContract.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import Foundation

//MARK: - VIPER

//MARK: - RouterAction
enum HomeRouterAction {
    case openUserProfile(user: User)
}

protocol HomeRouterProtocol {
    func go(to: HomeRouterAction)
}

//MARK: - Presenter
protocol HomePresenterProtocol: class {
    var viewModel: HomeViewModel { get set }
    
    func attach()
    func openUserProfile(user: User)
}

//MARK: - Interactor
protocol HomeInteractorProtocol: HomeNetworkingServiceProtocol {
}

//MARK: - ViewProtocol
protocol HomeViewControllerProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
    func UpdateUI()
    func showLoading(_ show: Bool)
}
