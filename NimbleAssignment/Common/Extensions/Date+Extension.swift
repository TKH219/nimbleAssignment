//
//  Date+Extension.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 04/03/2022.
//

import Foundation

public extension Date {
    func string(usingFormat format: String, usingTimeZone timeZone: TimeZone = TimeZone.current) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: self)
    }
}
