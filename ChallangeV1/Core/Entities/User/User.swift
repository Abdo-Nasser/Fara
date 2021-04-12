//
//  User.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import Foundation

struct User: Codable {
    var id: Int = 0
    var name: String = ""
    var username: String = ""
    var email: String = ""
    var address: Address? = Address()
    var phone: String? = ""
    var website: String? = ""
    var company: Company? = Company()
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }
}

struct Address: Codable {
    var street: String = ""
    var suite: String = ""
    var city: String = ""
    var zipcode: String = ""
    var geo: Coordinates? = Coordinates()
    
    enum CodingKeys: String, CodingKey {
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }
}

struct Coordinates: Codable { 
    var lat: String = ""
    var lng: String = ""
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
}

struct Company: Codable {
    var name: String = ""
    var catchPhrase: String? = ""
    var bs: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }
}
