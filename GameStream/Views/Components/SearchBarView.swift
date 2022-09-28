//
//  SearchBarView.swift
//  GameStream
//
//  Created by owner on 20/09/22.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchedText: String = ""
    @State private var gameNotFound: Bool = false
    @State private var isGameViewActive: Bool = false
    @ObservedObject var searchedGame: SearchGame = SearchGame()

    var body: some View {
        HStack{
            Button(action: { searchGame(name: self.searchedText) }) {
                Image(systemName: "magnifyingglass").foregroundColor(searchedText.isEmpty ? .yellow : Color("dark-cian"))
            }
            .alert(isPresented: $gameNotFound) {
                Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
            }
            
            
            
            ZStack(alignment: .leading){
                if searchedText.isEmpty {
                    Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                TextField(text: $searchedText, label: {}).foregroundColor(.white)
            }
        }.frame(maxWidth: .infinity, alignment: .leading).padding([.top, .leading, .bottom, .trailing], 11).background(Color("blue-gray")).clipShape(Capsule())
    }
    
    func searchGame(name: String) -> Void {
        print("1. Entramos al metodo searchGame")
        searchedGame.search(gameName: name)
        
        print("3. AQUI EL JUEGO YA DEBERIA EXISTIR")
        if searchedGame.searchedGame != nil {
            self.isGameViewActive = true
            self.gameNotFound = false
        } else {
            print("El juego buscado no existe...")
            self.gameNotFound = true
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
