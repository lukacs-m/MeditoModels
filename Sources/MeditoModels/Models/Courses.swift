//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

// MARK: - Courses

public struct CoursesContainer: Codable {
   public let courses: [Course]

    enum CodingKeys: String, CodingKey {
        case courses = "data"
    }
    
    public init(courses: [Course]) {
        self.courses = courses
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(CoursesContainer.self, from: data)
    }
}

// MARK: - Course

public struct Course: Codable, Identifiable, Coverable, PrimaryColorable, Navigable, Nameable {
    public let title, subtitle, type, id: String?
    public let cover: String?
    public let backgroundImage: String?
    public let primaryColor: String?

    enum CodingKeys: String, CodingKey {
        case title, subtitle, type, id, cover
        case backgroundImage = "background_image"
        case primaryColor = "color_primary"
    }

    public init(title: String?, subtitle: String?, type: String?,
                id: String?, cover: String?, backgroundImage: String?, primaryColor: String?) {
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.id = id
        self.cover = cover
        self.backgroundImage = backgroundImage
        self.primaryColor = primaryColor
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(Course.self, from: data)
    }
    
    public func getType() -> String {
        type ?? ""
    }

    public func getId() -> String {
        id ?? ""
    }
}
