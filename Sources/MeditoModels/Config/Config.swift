//
//  File.swift
//  
//
//  Created by Martin Lukacs on 19/06/2021.
//

import Foundation

enum Config {
    static let apiBaseUrl = "https://api.medito.app"
    
    static func getDownloadAssetURL(for content: String) -> URL? {
        let stringUrl = "\(Config.apiBaseUrl)/assets/\(content)?download"
        return URL(string: stringUrl.replacingOccurrences(of: " ", with: "%20", options: [.regularExpression]))
    }
}
