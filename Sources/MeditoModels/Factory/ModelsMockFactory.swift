//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

public struct ModelsMockFactory {
    static private func stubbedModelData(for filename: String) -> Data? {
        guard let path = Bundle.module.path(forResource: filename, ofType: "json") else {
            return nil
        }
        return try? Data(contentsOf: URL(fileURLWithPath: path))
    }
    
    static func getMockBackgroundContainer() -> BackgroundSoundsContainer? {
        guard let data = ModelsMockFactory.stubbedModelData(for: "BackgroundSoundsContainer") else {
            return nil
        }
        return try? BackgroundSoundsContainer(data: data)
    }
    
    static func getMockShortcutsContainer() -> ShortcutsContainer? {
        guard let data = ModelsMockFactory.stubbedModelData(for: "ShortcutsContainer") else {
            return nil
        }
        return try? ShortcutsContainer(data: data)
    }
    
    static func getMockMindfullPacksContainer() -> MindfullPacksContainer? {
        guard let data = ModelsMockFactory.stubbedModelData(for: "MindfullPacksContainer") else {
            return nil
        }
        return try? MindfullPacksContainer(data: data)
    }
}
