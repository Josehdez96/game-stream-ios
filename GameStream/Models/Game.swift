//
//  Game.swift
//  GameStream
//
//  Created by owner on 21/09/22.
//

import Foundation

struct Game: Codable, Hashable {
    let title, studio, contentRaiting, publicationYear, description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]
}

struct VideosUrls: Codable, Hashable {
    let mobile, tablet: String
}

struct SearchResults: Codable {
    var results: [Game]
}

