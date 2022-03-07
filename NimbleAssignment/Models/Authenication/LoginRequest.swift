//
//  LoginRequest.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation

class LoginRequest: BaseRequest {
    
    var grantType: String
    var email: String
    var password: String

    init(email: String, password: String) {
        self.grantType = GrantType.login.rawValue
        self.email = email
        self.password = password
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        grantType = try values.decode(String.self, forKey: .grantType)
        email = try values.decode(String.self, forKey: .email)
        password = try values.decode(String.self, forKey: .password)
        try super.init(from: decoder)
    }
    
    enum CodingKeys : String, CodingKey {
        case grantType = "grant_type"
        case email = "email"
        case password = "password"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(grantType, forKey: .grantType)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try super.encode(to: encoder)
    }
}
