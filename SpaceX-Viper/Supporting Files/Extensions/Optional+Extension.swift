//
//  Optional+Extension.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import Foundation

extension Optional where Wrapped == Int {
    
    func toString() -> String? {
        if let value = self {
            return String(value)
        }
        return nil
    }
}

extension Optional where Wrapped == Date {
    func toString() -> String? {
        let dateFormatter = ISO8601DateFormatter()
        
        if let date = self {
            return dateFormatter.string(from: date)
        }
        return nil
    }
}

extension Optional where Wrapped == String {
    func toInt() -> Int? {
        guard let stringValue = self else {
            return nil
        }
        return Int(stringValue)
    }
}

