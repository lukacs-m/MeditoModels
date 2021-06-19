//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

// MARK: - BackgroundSounds

public struct BackgroundSoundsContainer: Codable {
    let backgroundSounds: [BackgroundSound]

    enum CodingKeys: String, CodingKey {
        case backgroundSounds = "data"
    }
    
    public init(backgroundSounds: [BackgroundSound]) {
        self.backgroundSounds = backgroundSounds
    }
}

// MARK: - BackgroundSound

public struct BackgroundSound: Codable, Identifiable, Equatable {
    public let id: Int
    public let name: String
    public let soundFile: SoundFile?

    enum CodingKeys: String, CodingKey {
        case id, name
        case soundFile = "file"
    }
    
    public static func ==(lhs: BackgroundSound, rhs: BackgroundSound) -> Bool {
        lhs.id == rhs.id
    }
    
    public init(id: Int, name: String, soundFile: SoundFile?) {
        self.id = id
        self.name = name
        self.soundFile = soundFile
    }
}

// MARK: - Sound File

public struct SoundFile: Codable, Downloadable {
    public let id: String?
    public let length: String?
    
    public init(id: String?, length: String?) {
        self.id = id
        self.length = length
    }
}
