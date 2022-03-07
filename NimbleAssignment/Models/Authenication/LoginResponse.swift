//
//  LoginResponse.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation

class LoginResponse: BaseResponse {
    var data: LoginResponseInformation
    
    enum CodingKeys : String, CodingKey {
        case data = "data"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decode(LoginResponseInformation.self, forKey: .data)
        try super.init(from: decoder)
    }
}

struct LoginResponseInformation: Decodable {
    var id: Int
    var type: String
    var attributes: AuthenicationAttributes
    
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case type = "type"
        case attributes = "attributes"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        type = try values.decode(String.self, forKey: .type)
        attributes = try values.decode(AuthenicationAttributes.self, forKey: .attributes)
    }
}

struct AuthenicationAttributes: Decodable {
    var accessToken: String
    var tokenType: String
    var expiresIn: Int
    var refreshToken: String
    var createdAt: Int64
    
    enum CodingKeys : String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case createdAt = "created_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try values.decode(String.self, forKey: .accessToken)
        tokenType = try values.decode(String.self, forKey: .tokenType)
        expiresIn = try values.decode(Int.self, forKey: .expiresIn)
        refreshToken = try values.decode(String.self, forKey: .refreshToken)
        createdAt = try values.decode(Int64.self, forKey: .createdAt)
    }
}
