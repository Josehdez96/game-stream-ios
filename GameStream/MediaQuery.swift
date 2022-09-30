//
//  MediaQuery.swift
//  GameStream
//
//  Created by owner on 29/09/22.
//

import SwiftUI

struct MediaQuery: View {
    var body: some View {
        // Aquí al media query se le llama GeometryReader
        GeometryReader { geometry in
            VStack{
                // Para determinar TODO el width o height de una vista usamos [geometry.size.width/height], por ejemplo diviviendo entre 2, el elemento tomaría exactamente el tamaño de la mitad de la pantalla
                Image("platzi").resizable().frame(width: geometry.size.width / 2, height: 300)
            }
        }
    }
}

struct MediaQuery_Previews: PreviewProvider {
    static var previews: some View {
        MediaQuery()
    }
}
