//
//  GamesTitle.swift
//  GameStream
//
//  Created by owner on 28/09/22.
//

import SwiftUI

struct GamesTitle: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding([.top, .bottom, .leading]).background(Color("blue-gray"))
    }
}
