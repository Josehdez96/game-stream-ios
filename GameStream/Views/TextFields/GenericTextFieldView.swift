//
//  GenericTextField.swift
//  GameStream
//
//  Created by owner on 28/09/22.
//

import SwiftUI

struct GenericTextFieldView: View {
    init(title: String, initialText: String) {
        self.title = title
        self.initialText = initialText
    }
    
    var title: String
    var initialText: String
    @State private var name = ""
    var body: some View {
        VStack(alignment: .leading){
            Text(title).foregroundColor(.white).bold()
            
            
            ZStack(alignment: .leading){
                if name.isEmpty {
                    Text(initialText).font(.caption).foregroundColor(.gray)
                }
                TextField("", text: $name).foregroundColor(.white)
            }
            
            Divider().frame(height: 1).background(.white).padding(.top, -8)
        }
    }
}

struct GenericTextField_Previews: PreviewProvider {
    static var previews: some View {
        GenericTextFieldView(title: "", initialText: "")
    }
}
