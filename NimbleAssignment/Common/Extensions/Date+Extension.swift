//
//  Date+Extension.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 04/03/2022.
//

import Foundation

public extension Date {
    func string(usingFormat format: String, usingTimeZone timeZone: TimeZone = TimeZone.current, localeIdentifier: String? = nil) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = localeIdentifier == nil ? Locale.current : Locale(identifier: localeIdentifier!)
        return dateFormatter.string(from: self)
    }
    
    static func dateFromString(dateString: String) -> Date? {
        let tempString = dateString.split(separator: ".")
        var newDateString = String(tempString.first ?? "")
        if newDateString.count == 0 {
            newDateString = dateString
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        var formattedDate = dateFormatter.date(from: newDateString)
        if formattedDate == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssSS"
            formattedDate = dateFormatter.date(from: newDateString)
        }
        return formattedDate
    }
}
