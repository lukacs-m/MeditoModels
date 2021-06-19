//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

// MARK: - Folder

public struct FolderContainer: Codable {
    public let folder: Folder
    
    enum CodingKeys: String, CodingKey {
        case folder = "data"
    }
    
    public init(content: Folder) {
        self.folder = content
    }
}

// MARK: - DataClass

public struct Folder: Codable, Coverable, PrimaryColorable {
    public let id: Int
    public let title, description: String?
    public let cover, primaryColor: String?
    public let backgroundImage: String?
    public let items: [Item]

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case backgroundImage = "background_image"
        case primaryColor = "color_primary"
        case description
        case items
    }
    
    public init(id: Int, title: String?, description: String?, cover: String?, primaryColor: String?, backgroundImage: String?, items: [Item]) {
        self.id = id
        self.title = title
        self.description = description
        self.cover = cover
        self.primaryColor = primaryColor
        self.backgroundImage = backgroundImage
        self.items = items
    }
    
    public func getTitle() -> String {
        title ?? ""
    }

    public func getStringId() -> String {
        String(id)
    }
    
    public func getItemsContent() -> [ItemContent] {
        items.map(\.content)
    }
}

// MARK: - FolderItem

public struct Item: Codable {
    public let content: ItemContent
    
    enum CodingKeys: String, CodingKey {
        case content = "item"
    }
    
    public init(content: ItemContent) {
        self.content = content
    }
}

// MARK: - Item

public struct ItemContent: Codable, Identifiable, Navigable, Nameable {
    public let id: Int
    public let type: String
    public let title, subtitle: String?

    public func getType() -> String {
        type
    }

    public func getId() -> String {
        String(id)
    }
    
    public init(id: Int, type: String, title: String?, subtitle: String?) {
        self.id = id
        self.type = type
        self.title = title
        self.subtitle = subtitle
    }
}
