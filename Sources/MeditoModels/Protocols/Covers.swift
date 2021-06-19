//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

public typealias Coverable = MainImaging & BackgroundImaging

public protocol MainImaging {
    var cover: String? { get }
    func getImageUrl() -> URL?
}

extension MainImaging {
    public func getImageUrl() -> URL? {
        guard let cover = cover else {
            return nil
        }
        return Config.getDownloadAssetURL(for: cover)
    }
}

public protocol BackgroundImaging {
    var backgroundImage: String? { get }
    func getBackGroundImageUrl() -> URL?
}

extension BackgroundImaging {
    public func getBackGroundImageUrl() -> URL? {
        guard let backgroundImage = backgroundImage else {
            return nil
        }
        return Config.getDownloadAssetURL(for: backgroundImage)
    }
}
