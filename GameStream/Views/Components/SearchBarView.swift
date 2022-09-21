//
//  SearchBarView.swift
//  GameStream
//
//  Created by owner on 20/09/22.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchedText = ""
    var body: some View {
        HStack{
            Button(action: { print("Usuario buscó \(searchedText)") }) {
                Image(systemName: "magnifyingglass").foregroundColor(searchedText.isEmpty ? .yellow : Color("dark-cian"))
            }
            
            ZStack{
                if searchedText.isEmpty {
                    Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                } else {
                    TextField(text: $searchedText, label: {}).foregroundColor(.white)
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading).padding([.top, .leading, .bottom, .trailing], 11).background(Color("blue-gray")).clipShape(Capsule())
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
