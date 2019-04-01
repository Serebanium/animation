//
//  ExtensionURL.swift
//  animation
//
//  Created by Сергей Иванов on 01/04/2019.
//  Copyright © 2019 topMob. All rights reserved.
//
import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url
    }
}
