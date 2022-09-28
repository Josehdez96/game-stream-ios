//
//  GameView.swift
//  GameStream
//
//  Created by owner on 23/09/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    init(game: GameViewObject) {
        self.game = game
    }

    let game: GameViewObject
    var body: some View {
        ZStack{
            Color("general-background-color")
            VStack{
                VideoSection(url: game.url).frame(height: 300).padding(.bottom, 30)
                ScrollView{
                    DescriptionSection(game: game).padding(.bottom, 30)
                    GallerySection(imgUrls: game.imgUrls)
                }.frame(maxWidth: .infinity).padding(.horizontal, 20)
            }
        }.ignoresSafeArea().navigationBarHidden(true)
    }
}

struct VideoSection: View {
    init(url: String) {
        self.url = url
    }
    
    let url: String
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct DescriptionSection: View {
    init(game: GameViewObject) {
        self.game = game
    }
    
    @State private var liked = false
    @EnvironmentObject var favoriteGames: FavoriteGames
    var game: GameViewObject
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Text(game.title).foregroundColor(.white).font(.title).bold()
                Spacer()
                Button(action: {
                    liked.toggle()
                    // Guardar en favoritos
                    liked
                    ? favoriteGames.addToFavorites(game: self.game)
                    : favoriteGames.removeToFavorites(game: self.game)
                }) {
                    Image(systemName: liked ? "heart.fill" : "heart").foregroundColor(.white)
                }
            }
            
            HStack{
                Text(game.studio)
                Text(game.calification)
                Text(game.pubYear)
            }.foregroundColor(.white).font(.footnote).padding(.bottom, 10)
            
            Text(game.description).foregroundColor(.white).font(.caption)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GallerySection: View {
    init(imgUrls: [String]) {
        self.imgUrls = imgUrls
    }
    
    let imgUrls: [String]
    var body: some View {
        VStack(alignment: .leading){
            Text("GALERÍA").foregroundColor(.white).bold()
            ScrollView(.horizontal){
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 8) {
                    ForEach(imgUrls, id: \.self) { imgUrl in
                        KFImage(URL(string: imgUrl)).resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 200).clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
            }
        }
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: GameViewObject(game: Game(title: "Grand Theft Auto V", studio: "Rockstar Games", contentRaiting: "M", publicationYear: "2015", description: "Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second. ", platforms: [
            "PC",
            "Playstation 4",
            "Xbox One",
            "Xbox 360",
            "PS3"
        ], tags: [
            "Multiplayer",
            "Action",
            "Open World"
        ], videosUrls: VideosUrls(mobile: "https://dl.dropboxusercontent.com/s/klvhbfl20qp5dej/GTA480.mp4", tablet: "https://dl.dropboxusercontent.com/s/66x1qk3bqua5tf4/GTAMax.mp4?dl=0"), galleryImages: [
            "https://cdn.cloudflare.steamstatic.com/steam/apps/271590/ss_bab596ea9a6924055cd8c097bba75f052c18025d.600x338.jpg",
            "https://cdn.cloudflare.steamstatic.com/steam/apps/271590/ss_4627498ce6ec1516512468eecfb9f90b7fdf438b.600x338.jpg",
            "https://cdn.cloudflare.steamstatic.com/steam/apps/271590/ss_6b3e35dfc1acf5a742998fcd21690b5cddc367df.600x338.jpg"
        ]))
        )
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
