//
//  Encodable+Extension.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
