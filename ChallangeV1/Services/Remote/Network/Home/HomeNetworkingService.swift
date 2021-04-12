//
//  HomeNetworkingService.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import Foundation

protocol HomeNetworkingServiceProtocol {
    func getListOfUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

extension HomeNetworkingServiceProtocol {
    
    func getListOfUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let service = HomeNetworkingService()
        service.getListOfUsers(completion: completion)
    }
}
