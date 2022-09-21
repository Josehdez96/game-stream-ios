//
//  Game.swift
//  GameStream
//
//  Created by owner on 21/09/22.
//

import Foundation

struct Game: Codable {
    let title, studio, contentRaiting, publicationYear, description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]
}

struct VideosUrls: Codable {
    let mobile, tablet: String
}

