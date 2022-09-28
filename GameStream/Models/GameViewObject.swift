//
//  GameViewObject.swift
//  GameStream
//
//  Created by owner on 23/09/22.
//

struct GameViewObject: Hashable {
    let url: String
    let title: String
    let studio: String
    let calification: String
    let pubYear: String
    let description: String
    let tags: [String]
    let imgUrls: [String]

    init(game: Game) {
        url = game.videosUrls.mobile
        title = game.title
        studio = game.studio
        calification = game.contentRaiting
        pubYear = game.publicationYear
        description = game.description
        tags = game.tags
        imgUrls = game.galleryImages
    }
}
