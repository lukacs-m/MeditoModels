//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

public typealias Colorable = PrimaryColorable & SecondaryColorable

public protocol PrimaryColorable {
    var primaryColor: String? { get }
    func getPrimaryColor() -> String
}

extension PrimaryColorable {
    public func getPrimaryColor() -> String {
        guard let primaryColor = primaryColor, !primaryColor.isEmpty else {
            return "FFFFFF"
        }
        
        return primaryColor
    }
}

public protocol SecondaryColorable {
    var secondaryColor: String? { get }
    func getSecondaryColor() -> String
}

extension SecondaryColorable {
    public func getSecondaryColor() -> String {
        guard let secondaryColor = secondaryColor, !secondaryColor.isEmpty else {
            return "000000"
        }
        let trimedSecondaryColor = secondaryColor.replacingOccurrences(of: "#FF", with: "", options: [.regularExpression])
        
        return trimedSecondaryColor
    }
}
