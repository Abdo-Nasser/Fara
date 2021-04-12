//
//  HomeNetworkingServiceProtocol.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import UIKit

class HomeNetworkingService: MoyaServiceHelper<HomeAPI> {
    func getListOfUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        request(target: .getListOfUsers, completion: completion)
    }
}
