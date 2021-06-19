//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

public typealias Nameable = Titleable & Subtitleable

public protocol Titleable {
    var title: String? { get }
    func getTitle() -> String
}

extension Titleable {
    public func getTitle() -> String {
        title ?? ""
    }
}

public protocol Subtitleable {
    var subtitle: String? { get }
    func getSubtitle() -> String
}

extension Subtitleable {
    public func getSubtitle() -> String {
        subtitle ?? ""
    }
}
