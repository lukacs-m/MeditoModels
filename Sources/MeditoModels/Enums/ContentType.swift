//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

public enum ContentType: String, Codable {
    case article
    case daily
    case folder
    case session
    
    public static func isSupported(for type: String) -> Bool {
        return ContentType(rawValue: type) != nil
    }
}
