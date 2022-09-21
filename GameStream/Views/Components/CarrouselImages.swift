//
//  CarrouselImages.swift
//  GameStream
//
//  Created by owner on 21/09/22.
//

import SwiftUI

struct CarrouselImages: View {
    init(title: String, urlVideos: [String]) {
        self.title = title
        self.urlVideos = urlVideos
    }
    
    let title: String
    var urlVideos: [String]
    var body: some View {
        Text(title).font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Button(action: {}, label: {
                    Image("abzu-videogame").resizable().scaledToFit().frame(width: 240, height: 135)
                })
                Button(action: {}, label: {
                    Image("crash-bandicoot-videogame").resizable().scaledToFit().frame(width: 240, height: 135)
                })
                Button(action: {}, label: {
                    Image("gtav-videogame").resizable().scaledToFit().frame(width: 240, height: 135)
                })
                Button(action: {}, label: {
                    Image("death-stranding-videogame").resizable().scaledToFit().frame(width: 240, height: 135)
                })
                Button(action: {}, label: {
                    Image("hades-videogame").resizable().scaledToFit().frame(width: 240, height: 135)
                })
            }
        }
    }
}

struct CarrouselImages_Previews: PreviewProvider {
    static var previews: some View {
        CarrouselImages(title: "", urlVideos: [""])
    }
}
