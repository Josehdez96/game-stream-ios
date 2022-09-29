//
//  FavoritesView.swift
//  GameStream
//
//  Created by owner on 27/09/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    @EnvironmentObject var favoriteGames: FavoriteGames
    
    var body: some View {
        ZStack{
            Color("general-background-color").ignoresSafeArea()
            VStack{
                Text("Tus favoritos").font(.title2).bold().foregroundColor(.white).padding(.bottom, 9)
                ScrollView{
                    ForEach(favoriteGames.favoriteGames, id: \.self) { game in
                        VStack(spacing: 0){
                            VideoPlayer(player: AVPlayer(url: URL(string: game.url)!)).frame(height: 300)
                            Text(game.title).bold().modifier(GamesTitle())
                        }
                    }
                }.padding(.bottom, 8)
            }
        }
    }
}


//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
