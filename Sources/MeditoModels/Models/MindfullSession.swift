//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

// MARK: - Session

public struct MindfullSessionContainer: Codable {
    public let mindfullSession: MindfullSession
    
     enum CodingKeys: String, CodingKey {
         case mindfullSession = "data"
     }
    
    public init(mindfullSession: MindfullSession) {
        self.mindfullSession = mindfullSession
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(MindfullSessionContainer.self, from: data)
    }
}

// MARK: - DataClass

public struct MindfullSession: Codable, Identifiable, Coverable, Colorable, Navigable, Nameable {
    public let title, alternativeTitle, description: String?
    public let backgroundSound: Bool
    public let cover, primaryColor, secondaryColor: String?
    public let author: Author?
    public let id: Int
    public let subtitle: String?
    public let backgroundImage: String?
    public let audio: [AudioContainer]

    enum CodingKeys: String, CodingKey {
        case title
        case alternativeTitle = "alternative_title"
        case description
        case backgroundSound = "background_sound"
        case cover
        case primaryColor = "color_primary"
        case secondaryColor = "color_secondary"
        case author, id, subtitle
        case backgroundImage = "background_image"
        case audio
    }
    
    public init(title: String?, alternativeTitle: String?, description: String?, backgroundSound: Bool, cover: String?, primaryColor: String?, secondaryColor: String?, author: Author?, id: Int, subtitle: String?, backgroundImage: String?, audio: [AudioContainer]) {
        self.title = title
        self.alternativeTitle = alternativeTitle
        self.description = description
        self.backgroundSound = backgroundSound
        self.cover = cover
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.author = author
        self.id = id
        self.subtitle = subtitle
        self.backgroundImage = backgroundImage
        self.audio = audio
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(MindfullSession.self, from: data)
    }

    public func getOrderedFiles() -> [String: [AudioFile]] {
        var dictionary = Dictionary(grouping: getAudioFiles()) { file -> String in
            file.getVoice()
        }
        for (key, value) in dictionary {
            dictionary[key] = value.sorted { $0.getLength() < $1.getLength() }
        }
        return dictionary
    }

    public func getNarratorNames() -> [String] {
        getOrderedFiles().map(\.key).sorted()
    }

    public func getAudioFiles() -> [AudioFile] {
        audio.map(\.audioFile)
    }

    public func toData() -> Data {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return Data()
        }
    }

    public func getId() -> String {
        String(id)
    }

    public func getType() -> String {
        ContentType.session.rawValue
    }
}

// MARK: - Audio

public struct AudioContainer: Codable {
    public let audioFile: AudioFile
    
    enum CodingKeys: String, CodingKey {
        case audioFile = "file"
    }
    
    public init(audioFile: AudioFile) {
        self.audioFile = audioFile
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(AudioContainer.self, from: data)
    }
}

// MARK: - File

public struct AudioFile: Codable, Identifiable, Hashable, Downloadable {
    public let id, voice, length: String?
    
    public init(id: String?, voice: String?, length: String?) {
        self.id = id
        self.voice = voice
        self.length = length
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(AudioFile.self, from: data)
    }
    
    public func getLength() -> Int {
        guard let length = length else {
            return 0
        }
        var lenghtInMinutes = 0
        let elements = length.split(separator: ":")
        if let hours = elements.first {
            lenghtInMinutes = (Int(hours) ?? 0) * 60
        }
        lenghtInMinutes += Int(elements[1]) ?? 0
        return lenghtInMinutes
    }
    
    public func getVoice() -> String {
        voice ?? ""
    }
}

// MARK: - Author

public struct Author: Codable {
    public let body: String
    
    public init(body: String) {
        self.body = body
    }
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(Author.self, from: data)
    }
}
