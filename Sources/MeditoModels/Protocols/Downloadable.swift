//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

public protocol Downloadable {
    var id: String? { get }
    func getUrl() -> URL?
}

extension Downloadable {
    public func getUrl() -> URL? {
        guard let id = id else {
            return nil
        }
       return Config.getDownloadAssetURL(for: id)
    }
}
