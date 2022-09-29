//
//  ContentView.swift
//  GameStream
//
//  Created by owner on 15/09/22.
//

/*
 Falta por ajustar
 1. La espera en la busqueda de un juego con la SearchBar
 2. Gestionar el guardado de likes en cada juego
 */

import SwiftUI

struct ContentView: View {
    @StateObject var favoriteGames = FavoriteGames()
    var body: some View {
        NavigationView {
            ZStack{
                Color(
                    red: 19/255,
                    green: 30/255,
                    blue: 53/255,
                    opacity: 1.0
                ).ignoresSafeArea()
                VStack{
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 40)
                    LogInAndRegisterView()
                }
            }.navigationBarHidden(true)
        }.environmentObject(favoriteGames)
    }
}

struct LogInAndRegisterView: View {
    @State private var signInView = true
    var body: some View {
        VStack{
            HStack{
                Button(
                    "INICIA SESIÓN",
                    action: { signInView = true }
                )
                .padding(.leading, 30)
                .foregroundColor(signInView ? .white : .gray)
                Spacer()
                Button("REGÍSTRATE",
                       action: { signInView = false }
                )
                .padding(.trailing, 30)
                .foregroundColor(signInView ? .gray : .white)
            }
            if signInView == true {
                LogInView()
            } else {
                RegisterView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
