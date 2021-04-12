//
//  UserProfileRouter.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import UIKit

class UserProfileRouter: UserProfileRouterProtocol {
    
    weak var view: UIViewController?
    
    static func createUserProfileModule(user: User) -> UIViewController{
        let view = UserProfileViewController()
        let viewModel = UserProfileViewModel(user: user)
        let router = UserProfileRouter()
        let interactor = UserProfileInteractor()
        let presenter = UserProfilePresenter(view: view, interactor: interactor, router: router, viewModel: viewModel) 
        
        view.presenter = presenter
        router.view = view
        return view
    }
    
    func go(to: UserProfileRouterAction){
        switch to {
        case .back:
            view?.dismiss(animated: true, completion: nil)
        }
    }
}
