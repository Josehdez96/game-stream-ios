//
//  FavoriteGames.swift
//  GameStream
//
//  Created by owner on 27/09/22.
//

import Foundation

class FavoriteGames: ObservableObject {
    @Published var favoriteGames = [GameViewObject]()

    func addToFavorites(game: GameViewObject) -> Void {
        self.favoriteGames.append(game)
    }
    
    func removeToFavorites(game: GameViewObject) -> Void {
//        self.favoriteGames.rem
    }
}
