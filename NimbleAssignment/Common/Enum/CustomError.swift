//
//  CustomError.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation

enum CustomError: Error {
    case invalidGrant
    case invalidClient
    case invalidToken
    case invalidClientCredentials
    case jsonInvalid
    case unknown(String)
    case error
}
