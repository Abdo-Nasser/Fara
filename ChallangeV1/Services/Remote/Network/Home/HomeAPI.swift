//
//  HomeAPI.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import Moya

enum HomeAPI {
    case getListOfUsers
}

extension HomeAPI: TargetType, BaseAPIHeadersProtocol {
    var baseURL: URL {
        let stringURL = Constants.baseURL
        guard let url = URL(string: stringURL) else { fatalError("stringURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .getListOfUsers: return "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getListOfUsers:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return commonHeaders
    }
    
    var task: Task {
        switch self {
        case .getListOfUsers:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
}
