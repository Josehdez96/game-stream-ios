//
//  EmailFieldView.swift
//  GameStream
//
//  Created by owner on 19/09/22.
//

import SwiftUI

struct EmailFieldView: View {
    init(title: String, email: String) {
        self.title = title
        self.email = email
    }
    
    var title: String
    @State private var email = ""
    var body: some View {
        VStack(alignment: .leading){
            Text(title).foregroundColor(Color("dark-cian")).bold()
            
            
            ZStack(alignment: .leading){
                if email.isEmpty {
                    Text("ejemplo@gmail.com").font(.caption).tint(.gray)
                }
                TextField("", text: $email).foregroundColor(.white)
            }
            
            Divider().frame(height: 1).background(Color("dark-cian")).padding(.top, -8)
        }
    }
}

struct EmailFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailFieldView(title: "", email: "")
    }
}
