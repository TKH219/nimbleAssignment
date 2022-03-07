//
//  Result.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(CustomError)
}
