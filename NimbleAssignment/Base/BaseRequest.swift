//
//  BaseRequest.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation

class BaseRequest: Codable {
    
    var clientId: String
    var clientSecret: String
    
    enum CodingKeys : String, CodingKey {
        case clientId = "client_id"
        case clientSecret = "client_secret"
    }
    
    init() {
        self.clientId = CLIENT_ID
        self.clientSecret = CLIENT_SECRET
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        clientId = try values.decode(String.self, forKey: .clientId)
        clientSecret = try values.decode(String.self, forKey: .clientSecret)
    }
}

extension BaseRequest {
    func convertJsonToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }

}
