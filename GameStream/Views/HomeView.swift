//
//  HomeView.swift
//  GameStream
//
//  Created by owner on 20/09/22.
//

import SwiftUI
import AVKit

struct HomeView: View {
    init() {
        // Estamos modificando la librería anterior de la cual viene SwiftUI, UIKit para hacer modificaciones de color al TabView
        UITabBar.appearance().backgroundColor = UIColor(Color("blue-gray"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
    }
    
    @State var tabSelected: Int = 2
    var body: some View {
        TabView(selection: $tabSelected){
            Text("Pantalla perfil")
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            GamesView()
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            Home()
                .tabItem{
                    Image(systemName: "house")
                    Text("home")
                }.tag(2)
            
            Text("Pantalla favoritos")
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }.accentColor(.white)
    }
}

struct Home: View {
    let urlVideos: [String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    var body: some View {
        ZStack{
            Color("general-background-color").ignoresSafeArea()
            VStack{
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 30)

                SearchBarView().padding(.bottom)
                PopularSection(urlVideos: urlVideos).padding(.bottom)
                CarrouselIcons(title: "CATEGORIAS SUGERIDAS PARA TI", imageNames: ["fps", "rpg", "open-world"]).padding(.bottom)
                CarrouselImages(title: "RECOMENDADOS PARA TI", urlVideos: urlVideos)
                
            }.padding(.horizontal, 20)
        }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

struct PopularSection: View {
    init(urlVideos: [String]) {
        self.urlVideos = urlVideos
    }
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    var urlVideos: [String]
    var body: some View {
        VStack{
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            ZStack(alignment: .center){
                Button(action: { self.playVideo() }, label: {
                    VStack(spacing: 0){
                        Image("the-witcher-3").resizable().scaledToFill()
                        Text("The Witcher 3: Wild Hunt").bold().foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding([.top, .bottom, .leading]).background(Color("blue-gray"))
                    }
                })
                Image(systemName: "play.circle.fill").resizable().frame(width: 50, height: 50).foregroundColor(.white)
            }.frame(minWidth: 0, maxWidth: .infinity)
        }
        NavigationLink(
            isActive: $isPlayerActive,
            destination: {
                VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[0])!)).frame(width: 400, height: 300)
            },
            label: {
                EmptyView()
            }
        )
    }
    
    func playVideo() -> Void {
        isPlayerActive = true
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
