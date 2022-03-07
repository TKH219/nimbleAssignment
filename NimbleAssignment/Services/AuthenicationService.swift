//
//  AuthenicationService.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation

class AuthenicationService {
    let network: AlamofireClient = AlamofireClient(withBaseUrl: HOME_URL)
    
    func requestLogin(email: String, password: String, completion: ((Result<LoginResponse>) -> ())?) {
        let request = LoginRequest(email: email, password: password)
        network.requestPost(params: request.dictionary ?? [:],
                            path: LOGIN_PATH,
                            withBlockSuccess: {
            response in
            guard let response = response else { return }
            do {
                print(response)
                let jsonData = try JSONSerialization.data(withJSONObject: response, options: [])
                let decoder = JSONDecoder()
                let data = try decoder.decode(LoginResponse.self, from: jsonData)
                completion?(.success(data))
            } catch {
                completion?(.failure(.jsonInvalid))
            }
        }) { error in
            if let json = error as? [String:Any] {
                if let message = json["detail"] as? String {
                    completion?(.failure(.unknown(message)))
                } else {
                    completion?(.failure(.error))
                }
            }
        }
    }
}
