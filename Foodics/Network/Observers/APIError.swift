//
//  APIError.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

enum APIErrorType {

    case server
    case noData
    case parsing
    case string
    case network
    case known
}

struct APIError {
    
    var code: Int? = 0
    var message: String?
    var errors: Errors?
    var type: APIErrorType
}


struct Errors: Codable {
    
    var username: [String]?
    var email: [String]?
    var phone: [String]?
    var password: [String]?
    var buildingNo: [String]?
    var city: [String]?
    var area: [String]?
    var address: [String]?
    var street: [String]?
}

extension Errors {
    
    enum CodingKeys: String, CodingKey {
        
        case username
        case email
        case phone
        case password
        case buildingNo = "building_number"
        case city
        case area
        case address
        case street
    }
}
