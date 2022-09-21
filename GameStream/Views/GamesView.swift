//
//  GamesView.swift
//  GameStream
//
//  Created by owner on 21/09/22.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var videoGamesProvider = ViewModel()
    var body: some View {
        Text("Pantalla de juegos")
            .navigationBarHidden(true).navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                print("Cuando se cree esta pantalla GAMESVIEW este código se ejecutará")
                print("Primer elemento del JSON: \(videoGamesProvider.gamesInfo[0])")
                print("Primer elemento del JSON CON TITULO: \(videoGamesProvider.gamesInfo[0].title)")
            })
    }
}

//struct GamesView_Previews: PreviewProvider {
//    static var previews: some View {
//        GamesView()
//    }
//}
