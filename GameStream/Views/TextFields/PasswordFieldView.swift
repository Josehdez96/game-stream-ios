//
//  PasswordFieldView.swift
//  GameStream
//
//  Created by owner on 19/09/22.
//

import SwiftUI

struct PasswordFieldView: View {
    
    init(title: String, password: String) {
        self.title = title
        self.password = password
    }
    
    var title: String
    @State private var password = ""
    var body: some View {
        VStack(alignment: .leading){
            Text(title).foregroundColor(.white).bold().padding(.top, 10)
            
            ZStack(alignment: .leading){
                if password.isEmpty {
                    Text("*******").font(.caption).foregroundColor(.gray)
                }
                SecureField("", text: $password).foregroundColor(.white)
            }
            
            Divider().frame(height: 1).background(.white).padding(.top, -8)
        }
    }
}

struct PasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldView(title: "", password: "")
    }
}
