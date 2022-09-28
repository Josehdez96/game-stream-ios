//
//  GamesView.swift
//  GameStream
//
//  Created by owner on 21/09/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    @StateObject var videoGamesProvider = ViewModel()
    @State private var gameTouched: GameViewObject?

    let gamesGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            Color("general-background-color").ignoresSafeArea()
            VStack(spacing: 0){
                Text("Juegos").font(.title).bold().foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 64, trailing: 0))
                ScrollView {
                    LazyVGrid(columns: gamesGrid, spacing: 8) {
                        ForEach(videoGamesProvider.gamesInfo, id: \.self) {
                            game in
                            Button(action: {
                                self.gameTouched = GameViewObject(game: game)
                                videoGamesProvider.gameViewIsActive = true
                            }) {
                                KFImage(URL(string: game.galleryImages[0])).resizable().aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 4)).padding(.bottom, 12)
                            }
                        }
                    }
                }
            }.padding(.horizontal, 6)
            NavigationLink(isActive: $videoGamesProvider.gameViewIsActive) {
                if let game = self.gameTouched {
                    GameView(game: game)
                }
            } label: {
                EmptyView()
            }

        }.navigationBarHidden(true).navigationBarTitle("", displayMode: .inline)
//        .onAppear(perform: {
//                print("Cuando se cree esta pantalla GAMESVIEW este código se ejecutará")
//                print("Primer elemento del JSON: \(videoGamesProvider.gamesInfo[0])")
//                print("Primer elemento del JSON CON TITULO: \(videoGamesProvider.gamesInfo[0].title)")
//            })
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
