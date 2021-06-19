//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

// MARK: - Folder

public struct ArticleContainer: Codable {
    public let article: Article
    
    enum CodingKeys: String, CodingKey {
        case article = "data"
    }
    
    public init(content: Article) {
        self.article = content
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(ArticleContainer.self, from: data)
    }
}

public struct Article: Codable, Identifiable, Nameable, Navigable {
    public let id: Int
    public let title, subtitle, body: String?

    public func getBody() -> String {
        body ?? ""
    }
    
    public init(id: Int, title: String?, subtitle: String?, body: String?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.body = body
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(Article.self, from: data)
    }
    
    public func getId() -> String {
        String(id)
    }

    public func getType() -> String {
        ContentType.article.rawValue
    }
}
