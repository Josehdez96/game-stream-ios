//
//  OffsetPosition.swift
//  GameStream
//
//  Created by owner on 29/09/22.
//

import SwiftUI

struct OffsetPosition: View {
    var body: some View {
        VStack{
//            Offsets()
             Positions()
        }
    }
}

struct Offsets: View {
    var body: some View {
        // Aquí solo se pone la vista encima sin modificar los elementos que lo rodean el [Text] sigue en su misma posición
        Image("platzi").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200).offset(x: -100, y: 320)
        Text("Prueba 1 de mantener posición")
    }
}

struct Positions: View {
    var body: some View {
        // Aquí es distinto, si modifica a los elementos que lo rodean, al [text] en este caso. En este toma la posición relativa de su contenedor (osea, varía dependiendo de la posición de sus elementos hermanos)
        Image("platzi").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200).position(x: 99, y: 700)
        Text("Prueba 2 de mantener posición")
    }
}

struct OffsetPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsetPosition()
        OffsetPosition()
            .previewDevice("iPhone 8")
    }
}
