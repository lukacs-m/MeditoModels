//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

// MARK: - Shortcuts

public struct ShortcutsContainer: Codable {
    public let shortcuts: [Shortcut]

    enum CodingKeys: String, CodingKey {
        case shortcuts = "data"
    }
    
    public init(shortcuts: [Shortcut]) {
        self.shortcuts = shortcuts
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(ShortcutsContainer.self, from: data)
    }
}

// MARK: - Shortcut

public struct Shortcut: Codable, Identifiable, Coverable, PrimaryColorable, Navigable, Titleable {
    public let title, type, id: String?
    public let cover: String?
    public let primaryColor: String?
    public let backgroundImage: String?

    enum CodingKeys: String, CodingKey {
        case title, type, id, cover
        case primaryColor = "color_primary"
        case backgroundImage = "background_image"
    }

    public init(title: String?, type: String?, id: String?,
                cover: String?, primaryColor: String?, backgroundImage: String? = nil) {
        self.title = title
        self.type = type
        self.id = id
        self.cover = cover
        self.primaryColor = primaryColor
        self.backgroundImage = backgroundImage
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(Shortcut.self, from: data)
    }
    
    public func getType() -> String {
        type ?? ""
    }

    public func getId() -> String {
        id ?? ""
    }
}
