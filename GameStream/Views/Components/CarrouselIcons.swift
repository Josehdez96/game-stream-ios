//
//  CarrouselIcons.swift
//  GameStream
//
//  Created by owner on 21/09/22.
//

import SwiftUI

struct CarrouselIcons: View {
    init(title: String, imageNames: [String]) {
        self.title = title
        self.imageNames = imageNames
    }
    
    let title: String
    let imageNames: [String]
    var body: some View {
        Text(title).font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(imageNames, id: \.self) { imageName in
                    CarrouselIconsItem(imageName: imageName)
                }
            }
        }
    }
}

struct CarrouselIconsItem: View {
    init(imageName: String) {
        self.imageName = imageName
        let device = UIDevice.current.name // Nos devuelve un String diciendo que dispositvo es con su versión, mientras que [UIDevice.current.model] nos dice que modelo es (iphone, mac, ipad, etc)
        print("Nuestro dispositivo actual es: \(device)")
    }
    var imageName: String
    var body: some View {
        HStack{
            Button(action: {}) {
                ZStack{
                    RoundedRectangle(cornerRadius: 8).fill(Color("blue-gray")).frame(width: 160, height: 90)
                    Image(imageName).resizable().scaledToFit().frame(width: 42, height: 42)
                }
            }
        }
    }
}

struct CarrouselIcons_Previews: PreviewProvider {
    static var previews: some View {
        CarrouselIcons(title: "", imageNames: [""])
    }
}
